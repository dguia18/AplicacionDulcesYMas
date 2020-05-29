import { Component, OnInit } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { Producto } from '../../models/producto.model';
import { MatDialog } from '@angular/material';
import { NuevoProductoModalComponent } from '../../components/nuevo-producto-modal/nuevo-producto-modal.component';
@Component({
	selector: 'app-listar-productos',
	templateUrl: './listar-productos.component.html',
	styleUrls: ['./listar-productos.component.css']
})
export class ListarProductosComponent implements OnInit {
	public totalRecords = 0;
	public pageSize = 10;
	public pageIndex = 0;
	public pageSizeOptions: number[] = [5, 10, 15];
	public productos: Producto[] = [];
	constructor(private productoService: ProductoService, public dialog: MatDialog) { }

	ngOnInit(): void {
		this.getProductosPaginados(1, this.pageSize);
	}
	getProductosPaginados(page: number, rows: number): void {
		this.productoService.getProductosPaginados(page, rows).subscribe(
			response => {
				this.productos = response.data as Producto[];
				this.totalRecords = this.productos.length;
			}
		);
	}
	cambiarPagina(event: any): void {
		this.getProductosPaginados(event.pageIndex + 1, event.pageSize);
	}
	openDialog(): void {
		const dialogRef = this.dialog.open(NuevoProductoModalComponent, {
			width: '50%'
		});

		dialogRef.afterClosed().subscribe(result => {
		});
	}
}
