import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SharedModule } from '../Shared/shared.module';
import { PAGE_ROUTES } from './pages.routes';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DashboardComponent } from './dashboard/dashboard.component';
import { TerceroComponent } from './tercero/tercero.component';
import { ProductoComponent } from './producto/producto.component';
import { ListarProductosComponent } from './listar-productos/listar-productos.component';
import { NuevoProductoModalComponent } from '../components/nuevo-producto-modal/nuevo-producto-modal.component';



@NgModule({
	declarations: [ DashboardComponent, TerceroComponent, ProductoComponent, ListarProductosComponent, NuevoProductoModalComponent],
	exports: [
		DashboardComponent,
		TerceroComponent,
		ProductoComponent,
		NuevoProductoModalComponent
	],
	imports: [
		CommonModule,
		SharedModule,
		PAGE_ROUTES,
		FormsModule,
		ReactiveFormsModule
	],
	entryComponents: [NuevoProductoModalComponent]
})
export class PagesModule { }
