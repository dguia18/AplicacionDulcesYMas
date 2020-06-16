import { Component, OnInit, Inject } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { TerceroService } from '../../services/terceros/tercero.service';
import { TerceroEmpleado } from '../../models/tercero-empleado.model';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Fabricacion } from '../../models/fabricacion.model';
import { FabricacionDetalles } from '../../models/fabricacion-detalles.model';
import { debounceTime, distinctUntilChanged } from 'rxjs/operators';
import { Producto } from '../../models/producto.model';

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
	constructor(@Inject(MAT_DIALOG_DATA) private data: any,
		private productoService: ProductoService, private terceroService: TerceroService,
		private formBuilder: FormBuilder) {

		this.getEmpleadosPorBusqueda('');
		this.getProductosPorBusqueda('');
	}
	private getEmpleadosPorBusqueda(search: string): void {
		this.terceroService.getEmpleadosPorBusqueda(search)
			.subscribe(response => {
				this.empleados = response;
			});
	}
	private getProductosPorBusqueda(search: string): void {
		this.productoService.getProductosPorBusqueda(search)
			.subscribe(res => {
				this.productos = res;
			});
	}
	ngOnInit(): void {
		this.fabricacion = new Fabricacion();
		this.empleadoFormControl = this.formBuilder.control('', [Validators.required]);
		this.detallesDeFabricacionFormGroup = this.formBuilder.group({
			producto: ['', Validators.required],
			cantidad: ['', [Validators.required, Validators.min(1)]]
		});
		this.empleadoFormControl.valueChanges
			.pipe(debounceTime(500), distinctUntilChanged())
			.subscribe(res => this.getEmpleadosPorBusqueda(res));

		this.controlsDetalleFabricacion.producto.valueChanges
			.pipe(debounceTime(500), distinctUntilChanged())
			.subscribe(res => this.getProductosPorBusqueda(res));
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
