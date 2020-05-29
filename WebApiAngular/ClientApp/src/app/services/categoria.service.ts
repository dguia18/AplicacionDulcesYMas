import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { Response } from '../models/response.model';
import { environment } from 'src/environments/environment.prod';

@Injectable({
	providedIn: 'root'
})
export class CategoriaService {

	constructor(private httpClient: HttpClient) { }
	getSubCategorias(): Observable<Response> {
		return this.httpClient.get<Response>(`${environment.baseUrl}Categoria/subCategoria`);
	}
}
