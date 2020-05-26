import { Injectable } from '@angular/core';
import { TerceroUsuario } from '../../models/terceroUsuario.model';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Router } from '@angular/router';
import { map } from 'rxjs/operators';
import 'rxjs/add/operator/catch';
import { Response } from '../../models/response.model';
import { environment } from '../../../environments/environment.prod';
import { AuthService, IAuthStatus } from '../auth/auth.service';


@Injectable({
	providedIn: 'root'
})
export class TerceroUsuarioService {
	constructor(public httpClient: HttpClient, public router: Router) {
	}
	crearUsuario(usuario: TerceroUsuario) {

		const url = environment.baseUrl + 'tercero/usuario';

		return this.httpClient.post(url, usuario).pipe(
			map((resp: Response) => {
				return resp.data;
			}));
	}
}
