import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
	selector: 'app-tercero',
	templateUrl: './tercero.component.html',
	styleUrls: ['./tercero.component.css']
})
export class TerceroComponent implements OnInit {
	public tiposTercero = ['Clientes', 'Empleados', 'Proveedores'];
	public selectedValue: 'Clientes';
	constructor() { }

	ngOnInit(): void {
	}
	selectionChange(item) {
		this.selectedValue = item;
	}
}
