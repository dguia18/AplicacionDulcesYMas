import {
	Component, OnInit, Input, TemplateRef, ContentChild,
	ViewChild, Output, EventEmitter, AfterViewInit,
} from '@angular/core';
import { MatTable } from '@angular/material';

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
export class DataTableComponent implements OnInit, AfterViewInit {
	@ContentChild('rows', { static: false }) templateRef: TemplateRef<any>;
	@ViewChild('table') private tableView;
	@Input() headers: IHeaderTemplate[];
	@Input() information: IInformationTemplate;
	@Input() data: any[];
	@Output() table = new EventEmitter<MatTable<any>>();
	headerValues: string[] = [];

	constructor() {
	}

	ngAfterViewInit(): void {
		this.table.emit(this.tableView);
	}

	ngOnInit(): void {
		this.headers.forEach(x => this.headerValues.push(x.value));

	}
	get dataSource() {
		return this.data;
	}

}

