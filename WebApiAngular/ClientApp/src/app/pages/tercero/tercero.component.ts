import { Component, OnInit } from '@angular/core';
import { FormControl } from '@angular/forms';

@Component({
	selector: 'app-tercero',
	templateUrl: './tercero.component.html',
	styleUrls: ['./tercero.component.css']
})
export class TerceroComponent implements OnInit {
	public totalRecords = 0;
	public pageSize = 10;
	public pageIndex = 0;
	public pageSizeOptions: number[] = [5, 10, 15];
	public productos: Producto[] = [];
	public searchControl: FormControl = new FormControl();
	constructor() { }

	ngOnInit(): void {
	}

}
