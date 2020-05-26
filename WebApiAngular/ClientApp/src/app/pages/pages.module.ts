import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { PagesComponent } from './pages.component';
import { SharedModule } from '../Shared/shared.module';
import { PAGE_ROUTES } from './pages.routes';
import { FormsModule } from '@angular/forms';
import { DashboardComponent } from './dashboard/dashboard.component';
import { TerceroComponent } from './tercero/tercero.component';
import { ProductoComponent } from './producto/producto.component';



@NgModule({
	declarations: [ DashboardComponent, TerceroComponent, ProductoComponent],
	exports: [
		DashboardComponent,
		TerceroComponent,
		ProductoComponent
	],
	imports: [
		CommonModule,
		SharedModule,
		PAGE_ROUTES,
		FormsModule
	]
})
export class PagesModule { }
