import { Component, OnInit } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { Producto } from '../../models/producto.model';
import { MatDialog } from '@angular/material';
import { NuevoProductoModalComponent } from '../../components/nuevo-producto-modal/nuevo-producto-modal.component';
import { Router } from '@angular/router';
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
	constructor(private productoService: ProductoService,
		public dialog: MatDialog, private router: Router) { }

	ngOnInit(): void {
		this.getProductosPaginados(1, this.pageSize);
	}
	private getProductosPaginados(page: number, rows: number): void {
		this.productoService.getProductosPaginados(page, rows).subscribe(
			response => {
				this.productos = response.data as Producto[];
				this.totalRecords = this.productos.length;
			}
		);
	}
	public cambiarPagina(event: any): void {
		this.getProductosPaginados(event.pageIndex + 1, event.pageSize);
	}
	public openDialog(): void {
		const dialogRef = this.dialog.open(NuevoProductoModalComponent, {
			width: '40%', disableClose: true
		});

		dialogRef.afterClosed().subscribe(result => {
			this.getProductosPaginados(1, this.pageSize);
		});
	}
	public verInformacionDeProducto(id: number): void {
		this.router.navigate([`/productos/${id}/detalles`]);
	}
}
