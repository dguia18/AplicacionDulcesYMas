import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Producto } from '../../models/producto.model';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';
import { ResponseHttp } from '../../models/response.model';
import { transformError } from '../../commom/commom';
import { map, catchError } from 'rxjs/operators';
import { TipoProducto } from '../../models/enums/tipo-producto.enum';

@Injectable({
	providedIn: 'root'
})
export class ProductoService {

	constructor(private httpClient: HttpClient) { }
	public getProductosPaginados(page: number, rows: number, searchTerm: string = ''): Observable<ResponseHttp> {
		return this.httpClient
			.post<ResponseHttp>(`${environment.baseUrl}producto/GetPaginados`,
				{ page: page, rows: rows, termSearch: searchTerm });
	}
	public guardar(producto: Producto): Observable<ResponseHttp> {
		return this.httpClient
			.post<ResponseHttp>(`${environment.baseUrl}producto`, producto)
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
	public getProducto(id: number): Observable<ResponseHttp> {
		return this.httpClient
			.get<ResponseHttp>(`${environment.baseUrl}producto/${id}`)
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
	public getProductosPorTipo(tipo: TipoProducto) {
		return this.httpClient
			.get<ResponseHttp>(`${environment.baseUrl}producto/tipo/${tipo}`)
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
	public getProductosPorCategoria(id: number) {
		return this.httpClient
			.get<ResponseHttp>(`${environment.baseUrl}producto/categoria/${id}`)
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
}
