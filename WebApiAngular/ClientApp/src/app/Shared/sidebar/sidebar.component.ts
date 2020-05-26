import { Component, OnInit } from '@angular/core';
import { AuthService, IAuthStatus } from '../../services/auth/auth.service';

@Component({
	selector: 'app-sidebar',
	templateUrl: './sidebar.component.html',
	styleUrls: ['./sidebar.component.css']
})
export class SidebarComponent implements OnInit {
	sesion: IAuthStatus;
	constructor(private authService: AuthService) { }

	ngOnInit() {
		this.sesion = this.authService.getAuthStatus();
	}

}
