import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import {
	TerceroUsuarioService,
	SharedService, AuthGuard, AuthService,
	ProductoService, AuthHttpInterceptorService, CategoriaService,
	CompraService
} from './service.index';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';



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
		AuthService,
		CategoriaService,
		ProductoService,
		CompraService,
		{
			provide: HTTP_INTERCEPTORS,
			useClass: AuthHttpInterceptorService,
			multi: true
		}
	]
})
export class ServiceModule { }
