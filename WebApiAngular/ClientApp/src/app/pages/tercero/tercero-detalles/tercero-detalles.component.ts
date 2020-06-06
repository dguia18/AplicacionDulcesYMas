import { Component, OnInit, Input, ChangeDetectionStrategy } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { WhiteSpaceValidator } from '../../../Shared/validators/white-space-validator';
import { ActivatedRoute } from '@angular/router';
import { TerceroService } from '../../../services/terceros/tercero.service';
import { Tercero } from '../../../models/tercero.model';
import { Observable, from } from 'rxjs';
import { TerceroContacto } from '../../../models/terceroContacto.model';
import { IHeaderTemplate } from '../../../Shared/data-table/data-table.component';

@Component({
	selector: 'app-tercero-detalles',
	templateUrl: './tercero-detalles.component.html',
	styleUrls: ['./tercero-detalles.component.css'],
	changeDetection: ChangeDetectionStrategy.OnPush
})
export class TerceroDetallesComponent implements OnInit {
	@Input() selectedValue: string;
	@Input() set setTercero(value: Tercero) {
		this.tercero = value;
		this.contactos = from(this.tercero.contactosTercero);
		this.buildForm();
		this.mapTerceroForm();
	}
	public tercero: Tercero;
	public contactos: Observable<TerceroContacto>;

	headersContactos: IHeaderTemplate[] = [
		{ value: 'terceroDireccion', text: 'Dirección' },
		{ value: 'terceroEmail', text: 'Email' },
		{ value: 'terceroNumeroCelular', text: 'Celular' }];
	terceroForm: FormGroup;
	constructor(private formBuilder: FormBuilder,
		private terceroService: TerceroService) {

	}

	ngOnInit(): void {

	}
	private buildForm() {
		this.terceroForm = this.formBuilder.group({
			razonSocialTercero: ['', [Validators.required, Validators.maxLength(40)]],
			nitTercero: ['', [Validators.required, WhiteSpaceValidator.canNotContainSpace,
			Validators.maxLength(15)]],

			terceroDireccion: ['', [Validators.maxLength(30)]],
			terceroNumeroCelular: ['', [Validators.min(1000000), Validators.max(999999999999999)]],

			terceroEmail: ['', [Validators.email, Validators.maxLength(25),
			WhiteSpaceValidator.canNotContainSpace]]
		});
	}
	private mapTerceroForm(): void {
		this.terceroForm.patchValue({
			razonSocialTercero: this.tercero.razonSocialTercero,
			nitTercero: this.tercero.nitTercero,
		});
	}
	get controls() {
		return this.terceroForm.controls;
	}
}
