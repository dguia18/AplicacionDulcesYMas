import { Component, OnInit } from '@angular/core';

@Component({
	selector: 'app-pages',
	templateUrl: './pages.component.html',
	styleUrls: ['./pages.component.css']
})
export class PagesComponent implements OnInit {

	sidebarOpen = true;
	constructor() { }

	ngOnInit() {
	}
	sidebarToggler(event: any): void {
		this.sidebarOpen = !this.sidebarOpen;
	}

}
