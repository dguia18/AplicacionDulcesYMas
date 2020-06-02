import { Component, OnInit } from '@angular/core';
import { AuthService, IAuthStatus } from '../../services/auth/auth.service';

declare interface RouteInfo {
	path: string;
	title: string;
	icon: string;
	class: string;
}
export const Rutas: RouteInfo[] = [
	{ path: '/dashboard', title: 'Dashboard', icon: 'dashboard', class: '' },
	{ path: '/productos', title: 'Productos', icon: 'content_paste', class: '' },
	{ path: '/terceros', title: 'Terceros', icon: 'person', class: '' },
];

@Component({
	selector: 'app-sidebar',
	templateUrl: './sidebar.component.html',
	styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {
	sesion: IAuthStatus;
	menuItems: any;
	constructor(private authService: AuthService) { }

	ngOnInit() {
		this.sesion = this.authService.getAuthStatus();
		this.menuItems = Rutas.filter(menuItem => menuItem);
	}

}
