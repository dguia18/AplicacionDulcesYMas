import { PagesComponent } from './pages.component';
import { Routes, RouterModule, CanLoad } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';
import { AuthGuard } from '../services/guards/auth.guard';
import { Role } from '../models/role.model';
import { TerceroComponent } from './tercero/tercero.component';
import { ProductoComponent } from './producto/producto.component';
import { ListarProductosComponent } from './listar-productos/listar-productos.component';

const PAGES_ROUTES: Routes = [

	{
		path: 'dashboard', component: DashboardComponent, canActivate: [AuthGuard]
	},
	{
		path: 'terceros', component: TerceroComponent, canActivate: [AuthGuard],
		data: { expectedRole: 'administrador' }
	},
	{
		path: 'producto', component: ProductoComponent, canActivate: [AuthGuard],
		data: { expectedRole: 'administrador' }
	},
	{
		path: 'productos', component: ListarProductosComponent, canActivate: [AuthGuard],
		data: { expectedRole: 'administrador' }
	},
	{ path: '', redirectTo: '/dashboard', pathMatch: 'full' }

];

export const PAGE_ROUTES = RouterModule.forChild(PAGES_ROUTES);
