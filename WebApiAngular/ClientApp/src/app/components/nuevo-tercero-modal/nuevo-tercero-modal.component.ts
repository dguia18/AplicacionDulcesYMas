import { Component, OnInit, Input, ChangeDetectionStrategy, Optional, Inject } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { TerceroService } from '../../services/terceros/tercero.service';
import { Tercero } from '../../models/tercero.model';
import { WhiteSpaceValidator } from '../../Shared/validators/white-space-validator';
import { TerceroContacto } from '../../models/terceroContacto.model';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material';
import { ProductoService } from '../../services/producto/producto.service';
import { TipoProducto } from 'src/app/models/enums/tipo-producto.enum';
import { Producto } from '../../models/producto.model';

@Component({
	selector: 'app-nuevo-tercero-modal',
	templateUrl: './nuevo-tercero-modal.component.html',
	styleUrls: ['./nuevo-tercero-modal.component.css'],
	changeDetection: ChangeDetectionStrategy.OnPush
})
export class NuevoTerceroModalComponent implements OnInit {
	public selectedValue: string;
	nuevoTerceroForm: FormGroup;
	tercero: Tercero;
	contactos: TerceroContacto[] = [];
	mensaje: string;
	success = false;
	error = false;
	nuevoPrecioForm: FormGroup;
	productos: Producto[];
	constructor(public dialogRef: MatDialogRef<NuevoTerceroModalComponent>,
		@Optional() @Inject(MAT_DIALOG_DATA) public data: any,
		private formBuilder: FormBuilder, private terceroService: TerceroService,
		private productoService: ProductoService) {
		this.selectedValue = data.selectedValue;
		if (this.selectedValue === 'Clientes') {
			this.getProductosParaVender();
		}
	}
	private getProductosParaVender(): void {
		this.productoService.getProductosPorTipo(TipoProducto['Para Vender']).subscribe(res => {
			this.productos = res.data as Producto[];
		});
	}
	ngOnInit(): void {
		this.buildForm();
	}

	private buildForm() {
		this.nuevoTerceroForm = this.formBuilder.group({
			razonSocialTercero: ['', [Validators.required, Validators.maxLength(40)]],
			nitTercero: ['', [Validators.required, WhiteSpaceValidator.canNotContainSpace,
			Validators.maxLength(15)]],

			terceroDireccion: ['', [Validators.maxLength(30)]],
			terceroNumeroCelular: ['', [Validators.min(1000000), Validators.max(999999999999999)]],

			terceroEmail: ['', [Validators.email, Validators.maxLength(25),
			WhiteSpaceValidator.canNotContainSpace]]
		});
		this.nuevoPrecioForm = this.formBuilder.group({
			valor: ['', [Validators.required, Validators.min(1)]],
			producto: ['', [Validators.required]],
		});
	}
	get controls() {
		return this.nuevoTerceroForm.controls;
	}
	public guardar(): void {
		if (this.nuevoTerceroForm.valid) {
			this.crearTercero();
			this.terceroService.guardar(this.tercero, this.selectedValue).subscribe(response => {
				this.mensaje = response.mensaje;
				this.error = false;
				this.success = true;
			}, error => {
				this.mensaje = error;
				this.success = false;
				this.error = true;
			});
		}
	}

	private crearTercero() {
		this.contactos.push(new TerceroContacto
			(this.controls.terceroDireccion.value,
				this.controls.terceroEmail.value,
				this.controls.terceroNumeroCelular.value));

		this.tercero = new Tercero(this.controls.razonSocialTercero.value,
			this.controls.nitTercero.value,
			this.contactos);
	}
	agregarPrecio(): void {

	}
}
