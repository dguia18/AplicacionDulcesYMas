import { Component, OnInit, Input, OnChanges, SimpleChanges, ChangeDetectionStrategy } from '@angular/core';
import { FormControl } from '@angular/forms';
import { MatDialog } from '@angular/material';
import { Router } from '@angular/router';
import { NuevoTerceroModalComponent } from '../nuevo-tercero-modal/nuevo-tercero-modal.component';
import { TerceroService } from '../../services/terceros/tercero.service';
import { ResponseHttp } from '../../models/response.model';
import { TerceroCliente } from '../../models/tercero-cliente';
import { TerceroEmpleado } from '../../models/tercero-empleado.model';
import { TerceroProveedor } from '../../models/tercero-proveedor';
import { debounceTime, distinctUntilChanged, filter } from 'rxjs/operators';

@Component({
	selector: 'app-listar-terceros',
	templateUrl: './listar-terceros.component.html',
	styleUrls: ['./listar-terceros.component.css'],
	changeDetection: ChangeDetectionStrategy.OnPush
})
export class ListarTercerosComponent implements OnInit {
	public _selectedValue = 'Clientes';
	@Input() set selectedValue(value: string) {
		this._selectedValue = value;
		this.getTercerosPaginados(1, 10);
	}


	public totalRecords = 0;
	public pageSize = 10;
	public pageIndex = 0;
	public pageSizeOptions: number[] = [5, 10, 15];
	public terceros: [];
	public searchControl: FormControl = new FormControl();
	public mensaje: string;
	constructor(public dialog: MatDialog, private router: Router, private terceroService: TerceroService) { }

	ngOnInit(): void {
		this.iniciarEventoDeSearchForm();
		this.getTercerosPaginados(1, this.pageIndex);
	}
	private iniciarEventoDeSearchForm(): void {
		this.searchControl.valueChanges
			.pipe(filter(text => text.length > 1), debounceTime(500))
			.subscribe(res => {
				this.getTercerosPaginados(1, this.pageSize, res);
			});
	}
	public cambiarPagina(event: any): void {
		this.getTercerosPaginados(event.pageIndex + 1, event.pageSize);
	}
	private getTercerosPaginados(page: number, rows: number, searchTerm: string = ''): void {
		this.mensaje = undefined;
		this.terceros = undefined;
		this.terceroService.getTercerosPaginados(page, rows, this._selectedValue, searchTerm)
			.subscribe(
				response => {
					this.terceros = this.castData(response);
					console.log(this.terceros);

					this.totalRecords = this.terceros.length;
				}, error => {
					this.mensaje = error;
				}
			);
	}
	private castData(response: ResponseHttp): any {
		switch (this._selectedValue) {
			case 'Clientes':
				return response.data as TerceroCliente[];
			case 'Empleados':
				return response.data as TerceroEmpleado[];
			case 'Proveedores':
				return response.data as TerceroProveedor[];
			default:
				break;
		}
	}
	public openDialog(): void {
		const dialogRef = this.dialog.open(NuevoTerceroModalComponent, {
			width: '40%', disableClose: true, data: { selectedValue: this._selectedValue }
		});

		dialogRef.afterClosed().subscribe(result => {
			this.getTercerosPaginados(1, this.pageSize);
		});
	}
	public verInformacionDelTercero(id: number): void {
		switch (this._selectedValue) {
			case 'Clientes':
				this.router.navigate([`/terceros/clientes/${id}/detalles`]); break;
			case 'Empleados':
				this.router.navigate([`/terceros/empleados/${id}/detalles`]); break;
			case 'Proveedores':
				this.router.navigate([`/terceros/proveedores/${id}/detalles`]); break;
			default:
				break;
		}
	}
}
