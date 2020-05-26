import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { AuthService } from '../../services/auth/auth.service';

@Component({
	selector: 'app-header',
	templateUrl: './header.component.html',
	styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
	@Output() toggleSidebarForMe: EventEmitter<any> = new EventEmitter();
	constructor(private authService: AuthService) { }

	ngOnInit() {
	}
	toggleSidebar(): void {
		this.toggleSidebarForMe.emit();
	}
	salir() {
		this.authService.logout();
	}
}
