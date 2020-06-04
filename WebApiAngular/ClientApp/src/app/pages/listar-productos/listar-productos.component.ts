import { Component, OnInit, Input } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { Producto } from '../../models/producto.model';
import { MatDialog } from '@angular/material';
import { NuevoProductoModalComponent } from '../../components/nuevo-producto-modal/nuevo-producto-modal.component';
import { Router } from '@angular/router';
import { FormControl } from '@angular/forms';
import { distinctUntilChanged, debounceTime, filter } from 'rxjs/operators';
@Component({
	selector: 'app-listar-productos',
	templateUrl: './listar-productos.component.html',
	styleUrls: ['./listar-productos.component.css']
})
export class ListarProductosComponent implements OnInit {
	public totalRecords = 0;
	public pageSize = 20;
	public pageIndex = 0;
	public pageSizeOptions: number[] = [20, 25, 30];
	public productos: Producto[] = [];
	public searchControl: FormControl = new FormControl();

	constructor(private productoService: ProductoService,
		public dialog: MatDialog, private router: Router) { }

	ngOnInit(): void {
		this.getProductosPaginados(1, this.pageSize);
		this.searchControl.valueChanges
			.pipe(debounceTime(500), distinctUntilChanged())
			.subscribe(res => this.getProductosPaginados(1, this.pageSize, res));
	}
	private getProductosPaginados(page: number, rows: number, searchTerm: string = ''): void {
		this.productoService.getProductosPaginados(page, rows, searchTerm).subscribe(
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
