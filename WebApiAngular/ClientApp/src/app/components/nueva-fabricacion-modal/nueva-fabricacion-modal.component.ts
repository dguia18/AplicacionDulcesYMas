import { Component, OnInit, Inject } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { TerceroService } from '../../services/terceros/tercero.service';
import { TerceroEmpleado } from '../../models/tercero-empleado.model';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Fabricacion } from '../../models/fabricacion.model';
import { FabricacionDetalles } from '../../models/fabricacion-detalles.model';
import { debounceTime, distinctUntilChanged, startWith, map } from 'rxjs/operators';
import { Producto } from '../../models/producto.model';
import { Observable } from 'rxjs';
import { UnidadDeMedidaProducto } from '../../models/enums/unidad-de-medida-producto.enum';

@Component({
	selector: 'app-nueva-fabricacion-modal',
	templateUrl: './nueva-fabricacion-modal.component.html',
	styleUrls: ['./nueva-fabricacion-modal.component.css']
})
export class NuevaFabricacionModalComponent implements OnInit {
	public empleados: TerceroEmpleado[] = [];
	public empleadoFormControl: FormControl;
	public detallesDeFabricacionFormGroup: FormGroup;
	public fabricacion: Fabricacion;
	public productos: Producto[];
	public filteredOptions: Observable<Producto[]>;
	public productoSelected: Producto;

	constructor(@Inject(MAT_DIALOG_DATA) private data: any,
		private productoService: ProductoService, private terceroService: TerceroService,
		private formBuilder: FormBuilder) {

		this.getEmpleadosPorBusqueda('');
	}
	private getEmpleadosPorBusqueda(search: string): void {
		this.terceroService.getEmpleadosPorBusqueda(search)
			.subscribe(response => {
				this.empleados = response;
			});
	}
	private getProductosPorSubCategoria(subCategoriaId: number): void {
		this.productoService.getProductosPorSubCategoria(subCategoriaId)
			.subscribe(res => {
				this.productos = res;
			});
	}
	ngOnInit(): void {
		this.getProductosPorSubCategoria(1);
		this.fabricacion = new Fabricacion();
		this.buildForms();

		this.empleadoFormControl.valueChanges
			.pipe(debounceTime(500), distinctUntilChanged())
			.subscribe(res => this.getEmpleadosPorBusqueda(res));

		this.filteredOptions = this.controlsDetalleFabricacion.producto.valueChanges
			.pipe(debounceTime(500), distinctUntilChanged(),
				startWith(''),
				map(value => this._filter(value))
			);
	}
	private buildForms() {
		this.empleadoFormControl = this.formBuilder.control('', [Validators.required]);
		this.detallesDeFabricacionFormGroup = this.formBuilder.group({
			producto: ['', Validators.required],
			cantidad: ['', [Validators.required, Validators.min(1)]]
		});
	}
	public getUnidadDeMedidaProductoSeleccionado(): string {
		const producto = this.productos.find(x => x.nombreProducto === this.controlsDetalleFabricacion
			.producto.value);
		if (producto) {
			return UnidadDeMedidaProducto[producto.unidadDeMedidaProducto];
		}
		return '';
	}
	private _filter(value: string): Producto[] {
		const filterValue = value.toLowerCase();
		if (!this.productos) {
			return this.productos;
		}
		return this.productos.filter(option => option.nombreProducto.toLowerCase()
			.includes(filterValue));
	}
	get controlsDetalleFabricacion() {
		return this.detallesDeFabricacionFormGroup.controls;
	}
	public agregarDetalle(): void {
		this.empleadoFormControl.disable();
		this.fabricacion.detalles.push(new FabricacionDetalles(
			this.controlsDetalleFabricacion.producto.value,
			this.controlsDetalleFabricacion.cantidad.value
		));
	}
}
