import { Component, OnInit, Input, ChangeDetectionStrategy, OnChanges, SimpleChanges, OnDestroy } from '@angular/core';

export interface IHeaderTemplate {
	text: string;
	value: string;
}
export interface IInformationTemplate {
	title: string;
	subTitle: string;
}
@Component({
	selector: 'app-data-table',
	templateUrl: './data-table.component.html',
	styleUrls: ['./data-table.component.css'],
})
export class DataTableComponent implements OnInit {
	@Input() headers: IHeaderTemplate[];
	@Input() information: IInformationTemplate;
	private _data: any[];
	@Input() data: any[];
	headerValues: string[] = [];
	constructor() { }

	ngOnInit(): void {
		this.headers.forEach(x => this.headerValues.push(x.value));
	}
	get dataSource() {
		return this._data;
	}

}

