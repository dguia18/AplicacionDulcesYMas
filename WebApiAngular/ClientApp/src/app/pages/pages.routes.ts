import { PagesComponent } from './pages.component';
import { Routes, RouterModule, CanLoad, CanActivate } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AuthGuard } from '../services/guards/auth.guard';
import { Role } from '../models/role.model';
import { TerceroComponent } from './tercero/tercero.component';
import { ProductoDetallesComponent } from './producto-detalles/producto-detalles.component';
import { ListarProductosComponent } from './listar-productos/listar-productos.component';
import { TerceroDetallesComponent } from './tercero/tercero-detalles/tercero-detalles.component';

const PAGES_ROUTES: Routes = [

	{
		path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard]
	},
	{
		path: 'terceros', component: TerceroComponent, canActivate: [AuthGuard],
		data: { expectedRole: 'administrador' }
	},
	{
		path: 'productos', component: ListarProductosComponent, canActivate: [AuthGuard],
		data: { expectedRole: 'administrador' },
	},
	{
		path: 'productos/:id/detalles', component: ProductoDetallesComponent, canActivate: [AuthGuard]
	},
	{
		path: 'terceros/:id/detalles', component: TerceroDetallesComponent, canActivate: [AuthGuard]
	},
	{ path: '', redirectTo: '/dashboard', pathMatch: 'full' }

];

export const PAGE_ROUTES = RouterModule.forChild(PAGES_ROUTES);
