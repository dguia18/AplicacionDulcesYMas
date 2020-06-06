import { Component, OnInit, Input } from '@angular/core';
import { cloneDeep } from 'lodash';

export interface IHeaderTemplate {
	text: string;
	value: string;
}
@Component({
	selector: 'app-data-table',
	templateUrl: './data-table.component.html',
	styleUrls: ['./data-table.component.css']
})
export class DataTableComponent implements OnInit {
	@Input() headers: IHeaderTemplate[];
	private _data: any[];
	@Input() set data(values: any[]) {
		if (values) {
			this._data = values;
		}
	}
	values = Object.values;
	keys = Object.keys;
	headerValues: string[] = [];
	constructor() { }

	ngOnInit(): void {
		console.log(this.headers);
		console.log(
			this.values(this.headers[0]));
		console.log(this.keys(this.headers[0]));
		this.headers.forEach(x => this.headerValues.push(x.value));
		console.log(this.headerValues);

	}
	get dataSource() {
		return this._data;
	}

}

