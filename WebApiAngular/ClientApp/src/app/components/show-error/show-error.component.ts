import { Component, OnInit, Input } from '@angular/core';

@Component({
	selector: 'app-show-error',
	templateUrl: './show-error.component.html',
	styleUrls: ['./show-error.component.css']
})
export class ShowErrorComponent implements OnInit {
	@Input() mensaje: string;
	@Input() classAlert: string;
	constructor() { }

	ngOnInit(): void {
	}

}
