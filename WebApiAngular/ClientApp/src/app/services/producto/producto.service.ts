import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Producto } from '../../models/producto.model';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment.prod';

@Injectable({
	providedIn: 'root'
})
export class ProductoService {

	constructor(private httpClient: HttpClient) { }
	getProductosPaginados(page: number, rows: number): Observable<Producto> {
		return this.httpClient.get<Producto>(`${environment.baseUrl}GetPaginados/${page}/${rows}`);
	}
}
