import { Component, OnInit } from '@angular/core';
import { Compra } from '../../models/compra.model';
import { CompraService } from '../../services/compra/compra.service';
import { DataList } from 'src/app/components/listar/listar.component';
import { PaginationEmit } from '../../components/listar/listar.component';
import { MatDialog } from '@angular/material';
import { NuevaCompraModalComponent } from '../../components/nueva-compra-modal/nueva-compra-modal.component';
import { DatePipe, CurrencyPipe } from '@angular/common';

@Component({
	selector: 'app-compra',
	templateUrl: './compra.component.html',
	styleUrls: ['./compra.component.css']
})
export class CompraComponent implements OnInit {
	compras: Compra[];
	data: DataList[] = [];
	constructor(private compraService: CompraService, private dialog: MatDialog,
		private datePipe: DatePipe, private currencyPipe: CurrencyPipe) { }

	ngOnInit(): void {
		this.getComprasPaginadas(1, 20);
	}
	private getComprasPaginadas(page: number, row: number): void {
		this.compraService.getComprasPaginadas(page, row)
			.subscribe(res => {
				this.data = [];
				this.compras = res;
				this.compras.forEach(x => this.data.push(
					{
						title: this.datePipe.transform(x.fecha),
						subTittle: `Total: ` + this.currencyPipe.transform(x.total),
						id: x.id
					}));
			});
	}
	public openDialog(): void {
		const dialogRef = this.dialog.open(NuevaCompraModalComponent, {
			width: '900px', disableClose: true
		});

		dialogRef.afterClosed().subscribe(result => {
			this.getComprasPaginadas(1, 20);
		});
	}
	public onPaginationEmit(emit: PaginationEmit): void {
		this.getComprasPaginadas(emit.pageIndex, emit.pageSize);
	}
}
