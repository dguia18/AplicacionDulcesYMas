import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './login/register.component';
import { NopagefoundComponent } from './Shared/nopagefound/nopagefound.component';
import { PagesComponent } from './pages/pages.component';
import { AuthGuard } from './services/guards/auth.guard';



const ROUTES: Routes = [

	{ path: 'login', component: LoginComponent },
	{ path: 'register', component: RegisterComponent },
	{
		path: '',
		component: PagesComponent,
		canLoad: [AuthGuard],
		loadChildren: './pages/pages.module#PagesModule'
	},
	{ path: '**', component: NopagefoundComponent }
];

export const APP_ROUTES = RouterModule.forRoot(ROUTES, { useHash: true });
