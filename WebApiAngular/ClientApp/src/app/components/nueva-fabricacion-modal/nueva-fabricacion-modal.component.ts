import { Component, OnInit, Inject } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { TerceroService } from '../../services/terceros/tercero.service';
import { TerceroEmpleado } from '../../models/tercero-empleado.model';
import { FormControl, FormBuilder, FormGroup, Validators } from '@angular/forms';
import { Fabricacion } from '../../models/fabricacion.model';
import { FabricacionDetalles } from '../../models/fabricacion-detalles.model';

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
	constructor(@Inject(MAT_DIALOG_DATA) private data: any,
		private productoService: ProductoService, private terceroService: TerceroService,
		private formBuilder: FormBuilder) {

		this.getEmpleados();
	}
	private getEmpleados(): void {
		this.terceroService.getEspecificacionesTercero('empleados')
			.subscribe(response => {
				this.empleados = response.data as TerceroEmpleado[];
			});
	}
	ngOnInit(): void {
		this.fabricacion = new Fabricacion();
		this.empleadoFormControl = this.formBuilder.control('', [Validators.required]);
		this.detallesDeFabricacionFormGroup = this.formBuilder.group({
			producto: ['', Validators.required],
			cantidad: ['', [Validators.required, Validators.min(1)]]
		});
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
