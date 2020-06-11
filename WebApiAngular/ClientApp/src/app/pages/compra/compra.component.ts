import { Component, OnInit } from '@angular/core';
import { Compra } from '../../models/compra';
import { CompraService } from '../../services/compra/compra.service';
import { DataList } from 'src/app/components/listar/listar.component';
import { PaginationEmit } from '../../components/listar/listar.component';

@Component({
	selector: 'app-compra',
	templateUrl: './compra.component.html',
	styleUrls: ['./compra.component.css']
})
export class CompraComponent implements OnInit {
	compras: Compra[];
	data: DataList[];
	constructor(private compraService: CompraService) { }

	ngOnInit(): void {
		this.getComprasPaginadas(1, 10);
	}
	private getComprasPaginadas(page: number, row: number): void {
		this.compraService.getComprasPaginadas(page, row)
			.subscribe(res => {
				this.compras = res;
				this.compras.forEach(x => this.data.push(
					{
						title: x.fecha.toUTCString(),
						subTittle: `Total: ${x.total}`,
						id: x.id
					}));
			});
	}
	public openDialog(): void {

	}
	public onPaginationEmit(emit: PaginationEmit): void {
		this.getComprasPaginadas(emit.pageIndex, emit.pageSize);
	}
}
