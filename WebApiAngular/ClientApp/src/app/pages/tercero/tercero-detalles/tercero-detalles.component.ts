import { Component, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';

@Component({
	selector: 'app-tercero-detalles',
	templateUrl: './tercero-detalles.component.html',
	styleUrls: ['./tercero-detalles.component.css']
})
export class TerceroDetallesComponent implements OnInit {
	terceroForm: FormGroup;
	constructor() { }

	ngOnInit(): void {
	}
	get controls() {
		return this.terceroForm.controls;
	}
}
