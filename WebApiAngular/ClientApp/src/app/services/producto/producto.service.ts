import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Producto } from '../../models/producto.model';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { Response } from '../../models/response.model';

@Injectable({
	providedIn: 'root'
})
export class ProductoService {

	constructor(private httpClient: HttpClient) { }
	getProductosPaginados(page: number, rows: number): Observable<Response> {
		return this.httpClient
			.get<Response>(`${environment.baseUrl}producto/GetPaginados/${page}/${rows}`);
	}
	guardar(producto: Producto): Observable<Response> {
		return this.httpClient
			.get<Response>(`${environment.baseUrl}producto`);
	}
}
