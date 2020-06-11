import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment.prod';
import { Compra } from '../../models/compra';

@Injectable({
	providedIn: 'root'
})
export class CompraService {

	constructor(private httpClient: HttpClient) { }
	public getComprasPaginadas(page: number, row: number): Observable<Compra[]> {
		return this.httpClient.get<Compra[]>(`${environment.baseUrl}compra/getPaginados/?request=`
			+ encodeURIComponent(JSON.stringify({ page: page, rows: row })));
	}
}
