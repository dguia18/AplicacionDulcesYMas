import { Component, OnInit, Input, TemplateRef, ContentChild } from '@angular/core';

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
	@ContentChild('rows', { static: false }) templateRef: TemplateRef<any>;
	@Input() headers: IHeaderTemplate[];
	@Input() information: IInformationTemplate;
	@Input() data: any[];
	headerValues: string[] = [];

	constructor() { }

	ngOnInit(): void {
		this.headers.forEach(x => this.headerValues.push(x.value));
		console.log(this.data);

	}
	get dataSource() {
		return this.data;
	}

}

