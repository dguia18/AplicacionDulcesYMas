import { Component, OnInit } from '@angular/core';
import { ProductoService } from '../../services/producto/producto.service';
import { Producto } from '../../models/producto.model';
import { ActivatedRoute } from '@angular/router';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { TipoProducto } from '../../models/enums/tipo-producto.enum';
import { EspecificacionProducto } from 'src/app/models/enums/especificacion-producto.enum';
import { UnidadDeMedidaProducto } from '../../models/enums/unidad-de-medida-producto.enum';
import { CategoriaService } from '../../services/categoria.service';
import { SubCategoria } from '../../models/sub-categoria';

@Component({
	selector: 'app-producto-detalles',
	templateUrl: './producto-detalles.component.html',
	styleUrls: ['./producto-detalles.component.css']
})
export class ProductoDetallesComponent implements OnInit {
	private sub: any;
	id: number;
	producto: Producto;
	public productoForm: FormGroup;
	subCategorias: SubCategoria[] = [];
	public tipoDeProducto = TipoProducto;
	public tipoDeEspecificacion = EspecificacionProducto;
	public tipoDeUnidadDeMedida = UnidadDeMedidaProducto;
	public mensaje: string;
	public success = false;
	public error = false;
	tiposDeUnidadDeMedida = [];
	tiposDeProducto = [];
	tiposDeEspecificacion = [];
	constructor(private productoService: ProductoService, private route: ActivatedRoute,
		private formBuilder: FormBuilder, private categoriaService: CategoriaService) {
		this.tiposDeProducto = Object.keys(this.tipoDeProducto).filter(k => !isNaN(Number(k)));
		this.tiposDeEspecificacion = Object.keys(this.tipoDeEspecificacion).filter(k => !isNaN(Number(k)));
		this.tiposDeUnidadDeMedida = Object.keys(this.tipoDeUnidadDeMedida).filter(k => !isNaN(Number(k)));
	}

	ngOnInit(): void {
		this.sub = this.route.params.subscribe(params => {
			this.id = +params['id'];

			this.buildProductoForm();
			this.getSubCategorias();
			this.getProducto();
		});
	}
	buildProductoForm(): void {
		this.productoForm = this.formBuilder.group({
			nombreProducto: ['', [Validators.required]],
			tipo: ['', [Validators.required]],
			especificacion: ['', [Validators.required]],
			unidadDeMedidaProducto: ['', [Validators.required]],
			subCategoria: ['', [Validators.required]],
			cantidadProducto: [''],
			costoUnitarioProducto: [''],
			porcentajeDeUtilidadProducto: [''],
		});
	}
	getSubCategorias(): void {
		this.categoriaService.getSubCategorias()
			.subscribe(response => {
				this.subCategorias = response.data as SubCategoria[];
			});

	}
	getProducto(): void {
		this.productoService.getProducto(this.id).subscribe(response => {
			this.producto = response.data as Producto;
			this.productoForm.patchValue({
				nombreProducto: this.producto.nombreProducto,
				tipo: this.tiposDeProducto[this.producto.tipo],
				especificacion: this.tiposDeEspecificacion[this.producto.especificacion],
				unidadDeMedidaProducto: this.tiposDeUnidadDeMedida[this.producto.unidadDeMedidaProducto],
				subCategoria: this.producto.idSubCategoria,
				cantidadProducto: this.producto.cantidadProducto,
				costoUnitarioProducto: this.producto.costoUnitarioProducto,
				porcentajeDeUtilidadProducto: this.producto.porcentajeDeUtilidadProducto,
			});
		}, error => console.log(error));
	}
}
