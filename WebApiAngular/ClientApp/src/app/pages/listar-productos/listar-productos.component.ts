import { Component, OnInit } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { Producto } from '../../models/producto.model';

@Component({
	selector: 'app-listar-productos',
	templateUrl: './listar-productos.component.html',
	styleUrls: ['./listar-productos.component.css']
})
export class ListarProductosComponent implements OnInit {

	public productos: Producto[] = [];
	constructor(private productoService: ProductoService) { }

	ngOnInit(): void {
		this.getProductosPaginados(1, 10);
	}
	getProductosPaginados(page: number, rows: number): void {
		this.productoService.getProductosPaginados(page, rows).subscribe(
			response => {
				this.productos = response.data as Producto[];
			}
		);
	}

}
