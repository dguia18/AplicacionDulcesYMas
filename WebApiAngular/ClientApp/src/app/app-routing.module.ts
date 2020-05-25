import { Routes, RouterModule } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './login/register.component';
import { NopagefoundComponent } from './Shared/nopagefound/nopagefound.component';



const ROUTES: Routes = [

	{ path: 'login', component: LoginComponent },
	{ path: 'register', component: RegisterComponent },
	{ path: '', redirectTo: '/login', pathMatch: 'full' },
	{ path: '**', component: NopagefoundComponent }
];

export const APP_ROUTES = RouterModule.forRoot(ROUTES, { useHash: true });
