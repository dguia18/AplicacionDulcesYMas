import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TerceroUsuarioService, SharedService, AuthGuard, AuthService } from './service.index';
import { HttpClientModule } from '@angular/common/http';



@NgModule({
	declarations: [],
	imports: [
		CommonModule,
		HttpClientModule
	],
	providers: [
		AuthGuard,
		TerceroUsuarioService,
		SharedService,
		AuthService
	]
})
export class ServiceModule { }
