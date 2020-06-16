import { Component, OnInit, Input } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { Producto } from '../../models/producto.model';
import { MatDialog } from '@angular/material';
import { NuevoProductoModalComponent } from '../../components/nuevo-producto-modal/nuevo-producto-modal.component';
import { Router } from '@angular/router';
import { FormControl } from '@angular/forms';
import { distinctUntilChanged, debounceTime, filter } from 'rxjs/operators';
import { DataList } from 'src/app/components/listar/listar.component';
@Component({
	selector: 'app-listar-productos',
	templateUrl: './listar-productos.component.html',
	styleUrls: ['./listar-productos.component.css']
})
export class ListarProductosComponent implements OnInit {
	public pageSize = 20;
	public productos: Producto[] = [];
	public searchControl: FormControl = new FormControl();
	public data: DataList[] = [];

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
				this.data = [];
				this.productos = response.data as Producto[];
				this.productos.forEach(x => this.data.push(
					{
						title: x.nombreProducto,
						subTittle: `Bodega: ` + x.cantidadProducto,
						id: x.id
					}));
			}
		);
	}
	public onPaginationEmit(event: any): void {
		this.getProductosPaginados(event.pageIndex, event.pageSize);
	}
	public openDialog(): void {
		const dialogRef = this.dialog.open(NuevoProductoModalComponent, {
			width: '40%', disableClose: true
		});

		dialogRef.afterClosed().subscribe(result => {
			this.getProductosPaginados(1, this.pageSize);
		});
	}
}
