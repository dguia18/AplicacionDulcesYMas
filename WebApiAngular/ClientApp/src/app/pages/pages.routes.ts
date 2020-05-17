import { PagesComponent } from './pages.component';
import { Routes, RouterModule } from '@angular/router';
import { DashboardComponent } from './dashboard/dashboard.component';

const PAGES_ROUTES: Routes = [
	{
		path: '',
		component: PagesComponent,
		children: [
			{ path: 'dashboard', component: DashboardComponent },
			{ path: '', redirectTo: './dashboard', pathMatch: 'full' }
		]
	}
];

export const PAGE_ROUTES = RouterModule.forChild(PAGES_ROUTES);
