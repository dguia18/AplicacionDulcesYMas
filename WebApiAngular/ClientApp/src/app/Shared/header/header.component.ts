import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { TerceroUsuarioService } from '../../services/terceroUsuario/terceroUsuario.service';

@Component({
	selector: 'app-header',
	templateUrl: './header.component.html',
	styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
	@Output() toggleSidebarForMe: EventEmitter<any> = new EventEmitter();
	constructor(private usuarioService: TerceroUsuarioService) { }

	ngOnInit() {
	}
	toggleSidebar(): void {
		this.toggleSidebarForMe.emit();
	}
	salir() {
		this.usuarioService.logout();
	}
}
