import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { TerceroService } from '../../services/terceros/tercero.service';
import { Tercero } from '../../models/tercero.model';
import { WhiteSpaceValidator } from '../../Shared/validators/white-space-validator';

@Component({
	selector: 'app-nuevo-tercero-modal',
	templateUrl: './nuevo-tercero-modal.component.html',
	styleUrls: ['./nuevo-tercero-modal.component.css']
})
export class NuevoTerceroModalComponent implements OnInit {
	nuevoTerceroForm: FormGroup;
	tercero: Tercero;
	mensaje: string;
	success = false;
	error = false;
	constructor(private formBuilder: FormBuilder, private terceroService: TerceroService) { }

	ngOnInit(): void {
		this.buildForm();
		console.log(
			this.nuevoTerceroForm.controls);
	}
	private buildForm() {
		this.nuevoTerceroForm = this.formBuilder.group({
			razonSocialTercero: ['', [Validators.required]],
			nitTercero: ['', [Validators.required, WhiteSpaceValidator.canNotContainSpace]]
		});
	}
	get controls() {
		return this.nuevoTerceroForm.controls;
	}
	public guardar() {

	}
}
