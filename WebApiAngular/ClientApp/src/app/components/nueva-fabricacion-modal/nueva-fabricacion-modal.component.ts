import { Component, OnInit, Inject } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { MAT_DIALOG_DATA } from '@angular/material';
import { TerceroService } from '../../services/terceros/tercero.service';
import { TerceroEmpleado } from '../../models/tercero-empleado.model';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Fabricacion } from '../../models/fabricacion.model';
import { FabricacionDetalles } from '../../models/fabricacion-detalles.model';
import { debounceTime, distinctUntilChanged, startWith, map } from 'rxjs/operators';
import { Producto } from '../../models/producto.model';
import { Observable } from 'rxjs';
import { UnidadDeMedidaProducto } from '../../models/enums/unidad-de-medida-producto.enum';
import { IHeaderTemplate, IInformationTemplate } from '../../Shared/data-table/data-table.component';

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
	public table: any;
	public mensaje: string;
	public className: string;

	public headersDetallesFabricacion: IHeaderTemplate[] = [
		{ text: 'Producto', value: 'nombreMateriaPrima' },
		{ text: 'Cantidad', value: 'cantidadMateriaPrima' },
		{ text: 'Actions', value: 'actions' },
	];
	public informationDataTable: IInformationTemplate = {
		title: 'Lista de materias primas para la fabricacion', subTitle: ''
	};
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
	ngOnInit(): void {
		this.getProductosPorSubCategoria(1);
		this.fabricacion = new Fabricacion();
		this.buildForms();

		this.empleadoFormControl.valueChanges
			.pipe(debounceTime(300), distinctUntilChanged())
			.subscribe(res => this.getEmpleadosPorBusqueda(res));

		this.filteredOptions = this.controlsDetalleFabricacion.producto.valueChanges
			.pipe(
				startWith(''),
				map(value => this._filter(value))
			);
	}
	private getProductosPorSubCategoria(subCategoriaId: number): void {
		this.productoService.getProductosPorSubCategoria(subCategoriaId)
			.subscribe(res => {
				this.productos = res;
			});
	}

	private buildForms() {
		this.empleadoFormControl = this.formBuilder.control('', [Validators.required]);
		this.detallesDeFabricacionFormGroup = this.formBuilder.group({
			producto: ['', Validators.required],
			cantidad: ['', [Validators.required, Validators.min(1)]]
		});
	}
	private _filter(value: string): Producto[] {
		const filterValue = value ? value.toLowerCase() : '';
		if (!this.productos) {
			return this.productos;
		}
		return this.productos.filter(option => option.nombreProducto.toLowerCase()
			.includes(filterValue));
	}
	get controlsDetalleFabricacion() {
		return this.detallesDeFabricacionFormGroup.controls;
	}
	public getUnidadDeMedidaProductoSeleccionado(): string {
		const producto = this.productos.find(x => x.nombreProducto === this.controlsDetalleFabricacion
			.producto.value);
		if (producto) {
			return UnidadDeMedidaProducto[producto.unidadDeMedidaProducto];
		}
		return '';
	}

	public agregarDetalle(): void {
		this.empleadoFormControl.disable();
		const detalle = this.fabricacion.detalles.find(x => x.nombreMateriaPrima === this
			.controlsDetalleFabricacion.producto.value);

		if (detalle) {
			detalle.cantidadMateriaPrima = this.controlsDetalleFabricacion.cantidad.value;

		} else {
			this.fabricacion.detalles.push(new FabricacionDetalles(
				this.productos.find(x => x.nombreProducto === this
					.controlsDetalleFabricacion.producto.value).id,
				this.controlsDetalleFabricacion.cantidad.value,
				this.controlsDetalleFabricacion.producto.value
			));
		}
		console.log(this.filteredOptions);
		this.detallesDeFabricacionFormGroup.reset();
		this.table.renderRows();
	}
	public editarDetalleFabricacion(item: FabricacionDetalles): void {
		this.populateControlsDetalles(item);
	}
	private populateControlsDetalles(detalle: FabricacionDetalles): void {
		this.detallesDeFabricacionFormGroup.patchValue({
			cantidad: detalle.cantidadMateriaPrima,
			producto: detalle.nombreMateriaPrima
		});
	}
	public getEmiterTablaView(event: any) {
		this.table = event;
	}
	public agregarFabricacion(): void {
		this.fabricacion.nitEmpleado = this.empleadoFormControl.value;
		this.fabricacion.idProducto = this.data.producto.id;
		this.productoService.guardarFabricacion(this.fabricacion).subscribe(res => {
			this.mensaje = res.mensaje;
			this.className = 'success';
		}, error => {
			this.mensaje = error;
			this.className = 'danger';
		});
	}
}
