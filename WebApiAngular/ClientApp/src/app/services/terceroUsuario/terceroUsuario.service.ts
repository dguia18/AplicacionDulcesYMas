import { Injectable } from '@angular/core';
import { TerceroUsuario } from '../../models/terceroUsuario.model';
import { HttpClient } from '@angular/common/http';
import { getBaseUrl } from '../../../main';
import { Observable, BehaviorSubject, throwError as observableThrowError } from 'rxjs';
import { Router } from '@angular/router';
import { map, catchError } from 'rxjs/operators';
import 'rxjs/add/operator/catch';
import { Response } from '../../models/response.model';
import * as decode from 'jwt-decode';
import { environment } from '../../../environments/environment.prod';
import { Role } from '../../models/role.model';
import { transformError } from '../../commom/commom';
import { CacheService } from '../cache.service';

interface IServerAuthResponse {
	accessToken: string;
}
export interface IAuthStatus {
	role: string;
	primarySid: number;
	name: string;
}
const defaultAuthStatus: IAuthStatus = {
	role: 'none',
	primarySid: null, name: null
};
@Injectable({
	providedIn: 'root'
})
export class TerceroUsuarioService extends CacheService {
	usuario: TerceroUsuario;
	token: string;
	private readonly authProvider: (usuario: TerceroUsuario) => Observable<IServerAuthResponse>;
	authStatus = new BehaviorSubject<IAuthStatus>(this.getItem('authStatus') || defaultAuthStatus);

	constructor(public httpClient: HttpClient, public router: Router) {
		super();
		this.authStatus.subscribe(authStatus => {
			this.setItem('authStatus', authStatus);
		});
		this.authProvider = this.userAuthProvider;
	}
	private userAuthProvider(usuario: TerceroUsuario): Observable<IServerAuthResponse> {
		return this.httpClient.post<IServerAuthResponse>(`${environment.baseUrl}token`, usuario);
	}
	login(usuario: TerceroUsuario): Observable<IAuthStatus> {
		this.logout();
		const loginResponse = this.authProvider(usuario).pipe(
			map((respuesta: any) => {
				const accessToken = decode(respuesta.accessToken);
				this.setToken(respuesta.accessToken);
				return accessToken as IAuthStatus;
			}), catchError(transformError)
		);
		loginResponse.subscribe(
			respuesta => {
				this.authStatus.next(respuesta);
			},
			error => {
				this.logout();
				return observableThrowError(error);
			}
		);
		return loginResponse;
	}
	guardarStorage(token: string, usuario: TerceroUsuario, menu: any) {

		localStorage.setItem('token', token);
		localStorage.setItem('usuario', JSON.stringify(usuario));
		// localStorage.setItem('menu', JSON.stringify(menu));

		this.usuario = usuario;
		this.token = token;
		// this.menu = menu;
	}
	cargarStorage() {

		if (localStorage.getItem('token')) {
			this.token = localStorage.getItem('token');
			this.usuario = JSON.parse(localStorage.getItem('usuario'));
			// this.menu = JSON.parse(localStorage.getItem('menu'));
		} else {
			this.token = '';
			this.usuario = null;
			// this.menu = [];
		}

	}
	logout() {
		this.clearToken();
		this.authStatus.next(defaultAuthStatus);
		this.router.navigate(['/login']);
	}
	crearUsuario(usuario: TerceroUsuario) {

		const url = environment.baseUrl + 'tercero/usuario';

		return this.httpClient.post(url, usuario).pipe(
			map((resp: Response) => {
				return resp.data;
			}));
	}
	private setToken(jwt: string) {
		return this.setItem('jwt', jwt);
	}
	getToken(): string {
		return this.getItem('jwt') || '';
	}
	private clearToken() {
		this.removeItem('jwt');
	}
	getAuthStatus(): IAuthStatus {
		return this.getItem('authStatus');
	}
}
