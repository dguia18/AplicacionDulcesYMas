import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { Router } from '@angular/router';

export interface DataList {
	title: string;
	subTittle: string;
	id: number;
}
export interface PaginationEmit {
	pageSize: number;
	pageIndex: number;
}
@Component({
	selector: 'app-listar',
	templateUrl: './listar.component.html',
	styleUrls: ['./listar.component.css']
})
export class ListarComponent implements OnInit {
	_data: DataList[];
	totalRecords: number;
	@Input() set data(value) {
		if (value) {
			this._data = value;
			this.totalRecords = this._data.length;
		}
	}
	@Input() path: string;
	@Output() paginationEmit = new EventEmitter<PaginationEmit>();
	public pageSize = 20;
	public pageIndex = 0;
	public pageSizeOptions: number[] = [20, 25, 30];
	constructor(private router: Router) { }

	ngOnInit(): void {
	}
	get dataSource() {
		return this._data;
	}

	public verInformacion(id: number): void {
		this.router.navigate([`/${this.path}/${id}/detalles`]);
	}
	public cambiarPagina(event: any): void {
		this.paginationEmit.emit({ pageIndex: event.pageIndex, pageSize: event.pageSize });
	}
}
