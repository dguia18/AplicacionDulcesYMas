import { Injectable } from '@angular/core';
import { TerceroUsuario } from '../../models/terceroUsuario.model';
import { CacheService } from '../cache.service';
import { Observable, BehaviorSubject, throwError as observableThrowError } from 'rxjs';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { environment } from 'src/environments/environment.prod';
import { map, catchError } from 'rxjs/operators';
import * as decode from 'jwt-decode';
import { transformError } from '../../commom/commom';
import { ResponseHttp } from '../../models/response.model';

interface IServerAuthResponse {
	accessToken: string;
}
export interface IAuthStatus {
	role: string;
	primarysid: number;
	unique_name: string;
}
const defaultAuthStatus: IAuthStatus = {
	role: 'none',
	primarysid: null, unique_name: null
};

@Injectable({
	providedIn: 'root'
})
export class AuthService extends CacheService {
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
	logout() {
		this.clearToken();
		this.authStatus.next(defaultAuthStatus);
		this.router.navigate(['/login']);
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
