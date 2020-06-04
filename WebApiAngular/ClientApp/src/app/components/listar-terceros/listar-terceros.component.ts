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
	}
	public cambiarPagina(event: any): void {
		this.getTercerosPaginados(event.pageIndex + 1, event.pageSize);
	}
	private getTercerosPaginados(page: number, rows: number, searchTerm: string = ''): void {
		this.mensaje = undefined;
		this.terceroService.getTercerosPaginados(page, rows, this._selectedValue, searchTerm).subscribe(
			response => {
				this.terceros = this.castData(response);
				this.totalRecords = this.terceros.length;
			}, error => {
				this.mensaje = error;
			}
		);
	}
	private castData(response: ResponseHttp): any {
		switch (this.selectedValue) {
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
			width: '40%', disableClose: true
		});

		dialogRef.afterClosed().subscribe(result => {
			this.getTercerosPaginados(1, this.pageSize);
		});
	}
	public verInformacionDelTercero(id: number): void {
		this.router.navigate([`/terceros/${id}/detalles`]);
	}
}
