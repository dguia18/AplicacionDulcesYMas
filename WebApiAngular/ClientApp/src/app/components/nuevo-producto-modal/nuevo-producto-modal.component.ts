import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Producto } from '../../models/producto.model';
import { WhiteSpaceValidator } from '../../Shared/validators/white-space-validator';
import { TipoProducto } from '../../models/enums/tipo-producto.enum';
import { EspecificacionProducto } from '../../models/enums/especificacion-producto.enum';
import { UnidadDeMedidaProducto } from '../../models/enums/unidad-de-medida-producto.enum';
import { ProductoService } from '../../services/producto/producto.service';
import { CategoriaService } from '../../services/categoria.service';
import { SubCategoria } from '../../models/sub-categoria';

@Component({
	selector: 'app-nuevo-producto-modal',
	templateUrl: './nuevo-producto-modal.component.html',
	styleUrls: ['./nuevo-producto-modal.component.css']
})
export class NuevoProductoModalComponent implements OnInit {
	nuevoProductoForm: FormGroup;
	producto: Producto;
	subCategorias: SubCategoria[] = [];
	public tipoDeProducto = TipoProducto;
	public tipoDeEspecificacion = EspecificacionProducto;
	public tipoDeUnidadDeMedida = UnidadDeMedidaProducto;
	tiposDeUnidadDeMedida = [];
	tiposDeProducto = [];
	tiposDeEspecificacion = [];
	keys = Object.keys;
	constructor(private formBuilder: FormBuilder, private productoService: ProductoService,
		private categoriaService: CategoriaService) {
		this.buildNuevoProductoForm();
		this.tiposDeProducto = Object.keys(this.tipoDeProducto).filter(k => !isNaN(Number(k)));
		this.tiposDeEspecificacion = Object.keys(this.tipoDeEspecificacion).filter(k => !isNaN(Number(k)));
		this.tiposDeUnidadDeMedida = Object.keys(this.tipoDeUnidadDeMedida).filter(k => !isNaN(Number(k)));
		this.categoriaService.getSubCategorias()
			.subscribe(response => {
				this.subCategorias = response.data as SubCategoria[];
				console.log(this.subCategorias);
			});
	}

	ngOnInit(): void {
	}
	buildNuevoProductoForm(): void {
		this.nuevoProductoForm = this.formBuilder.group({
			nombreProducto: ['', [Validators.required, WhiteSpaceValidator.canNotContainSpace]],
			tipo: ['', [Validators.required, WhiteSpaceValidator.canNotContainSpace]],
			especificacionProducto: ['', [Validators.required, WhiteSpaceValidator.canNotContainSpace]],
			unidadDeMedidaProducto: ['', [Validators.required, WhiteSpaceValidator.canNotContainSpace]],
			subCategoria: ['', [Validators.required, WhiteSpaceValidator.canNotContainSpace]],
			cantidadProducto: [''],
			costoUnitarioProducto: [''],
			porcentajeDeUtilidadProducto: [''],
		});
	}
	guardar(): void {
		if (this.nuevoProductoForm.valid) {
			const producto = new Producto(
				this.nuevoProductoForm.get('nombreProducto').value,
				this.nuevoProductoForm.get('unidadDeMedidaProducto').value,
				this.nuevoProductoForm.get('especificacionProducto').value,
				this.nuevoProductoForm.get('tipo').value,
				this.nuevoProductoForm.get('subCategoria').value,
				0, null, null,
				this.nuevoProductoForm.get('cantidadProducto').value,
				this.nuevoProductoForm.get('costoUnitarioProducto').value,
				this.nuevoProductoForm.get('porcentajeDeUtilidadProducto').value,
			);

		}
	}
}
