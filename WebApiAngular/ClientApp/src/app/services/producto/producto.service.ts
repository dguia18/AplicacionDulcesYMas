import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Producto } from '../../models/producto.model';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { ResponseHttp } from '../../models/response.model';

@Injectable({
	providedIn: 'root'
})
export class ProductoService {

	constructor(private httpClient: HttpClient) { }
	getProductosPaginados(page: number, rows: number): Observable<ResponseHttp> {
		return this.httpClient
			.get<ResponseHttp>(`${environment.baseUrl}producto/GetPaginados/${page}/${rows}`);
	}
	guardar(producto: Producto): Observable<ResponseHttp> {
		return this.httpClient
			.post<ResponseHttp>(`${environment.baseUrl}producto`, producto);
	}
}
