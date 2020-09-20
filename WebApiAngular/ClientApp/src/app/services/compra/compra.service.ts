import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment.prod';
import { Compra } from '../../models/compra.model';
import { ResponseHttp } from '../../models/response.model';
import { catchError, map } from 'rxjs/operators';
import { transformError } from '../../commom/commom';
import { getBaseUrl } from 'src/main';

@Injectable({
	providedIn: 'root'
})
export class CompraService {

	constructor(private httpClient: HttpClient) { }
	public getComprasPaginadas(page: number, row: number): Observable<Compra[]> {
		return this.httpClient.post<Compra[]>(`${getBaseUrl()}api/compra/getPaginados`
			, { page: page, rows: row });
	}
	public addCompra(compra: Compra): Observable<ResponseHttp> {
		return this.httpClient.post<ResponseHttp>(`${getBaseUrl()}api/compra`, compra)
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
}
