import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, UrlTree, CanLoad, CanActivateChild, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { Route } from '@angular/compiler/src/core';
import { TerceroUsuarioService, IAuthStatus } from '../terceroUsuario/terceroUsuario.service';

@Injectable({
	providedIn: 'root'
})
export class AuthGuard implements CanActivate, CanLoad, CanActivateChild {
	protected currentAuthStatus: IAuthStatus;
	constructor(private usuarioService: TerceroUsuarioService, private router: Router) {
		this.usuarioService.authStatus.subscribe(authStatus =>
			this.currentAuthStatus = this.usuarioService.getAuthStatus());
	}
	canActivateChild(childRoute: ActivatedRouteSnapshot, state: RouterStateSnapshot): boolean | Observable<boolean> | Promise<boolean> {
		return this.checkPermisos(childRoute);
	}
	canLoad(route: Route): boolean | Observable<boolean> | Promise<boolean> {
		return this.checkLogin();
	}
	canActivate(
		next: ActivatedRouteSnapshot,
		state: RouterStateSnapshot): Observable<boolean> | Promise<boolean> | boolean {
		return this.checkPermisos(next);
	}
	protected checkLogin() {
		if (this.usuarioService.getToken() == null || this.usuarioService.getToken() === '') {
			this.router.navigate(['login']);
			return false;
		}
		return true;
	}
	protected checkPermisos(route?: ActivatedRouteSnapshot) {
		let roleMatch = true;
		let params: any;
		if (route) {
			const expectedRole = route.data.expectedRole;
			if (expectedRole) {
				roleMatch = this.currentAuthStatus.role === expectedRole;
			}
		}
		if (!roleMatch) {
			this.router.navigate(['dashboard']);
			return false;
		}
		return true;
	}
}
