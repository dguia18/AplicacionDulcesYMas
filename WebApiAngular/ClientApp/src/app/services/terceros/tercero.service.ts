import { Injectable } from '@angular/core';
import { HttpClient, HttpResponse } from '@angular/common/http';
import { Observable } from 'rxjs';
import { ResponseHttp } from '../../models/response.model';
import { environment } from 'src/environments/environment.prod';
import { map, catchError } from 'rxjs/operators';
import { transformError } from '../../commom/commom';
import { Tercero } from '../../models/tercero.model';
import { TerceroEmpleado } from 'src/app/models/tercero-empleado.model';
import { getBaseUrl } from 'src/main';

@Injectable({
	providedIn: 'root'
})
export class TerceroService {


	constructor(private httpClient: HttpClient) { }

	public getTercerosPaginados(page: number, rows: number, selectValue: string,
		searchTerm: string = ''): Observable<ResponseHttp> {

		return this.httpClient.post<ResponseHttp>(`${getBaseUrl()}api/tercero/${selectValue}/GetPaginados`,
			{ page: page, rows: rows, termSearch: searchTerm })
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
	public guardar(tercero: Tercero, tipo: string): Observable<ResponseHttp> {
		return this.httpClient
			.post<ResponseHttp>(`${getBaseUrl()}api/tercero/${tipo}`, { tercero: tercero })
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
	public getEspecificacionesTercero(especificacion: string): Observable<ResponseHttp> {
		return this.httpClient.get<ResponseHttp>(`${getBaseUrl()}api/tercero/
		${especificacion}`)
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
	public getEspecificacionTercero(id: number, especificacion: string): Observable<ResponseHttp> {
		return this.httpClient.get<ResponseHttp>(`${getBaseUrl()}api/tercero/
		${especificacion}/${id}`)
			.pipe(map((respuesta: any) => {
				return respuesta as ResponseHttp;
			}), catchError(transformError));
	}
	public getEmpleadosPorBusqueda(search: string): Observable<TerceroEmpleado[]> {
		return this.httpClient.get<TerceroEmpleado[]>(`${getBaseUrl()}api/tercero/
		empleados/busqueda/${search}`);
	}
}

