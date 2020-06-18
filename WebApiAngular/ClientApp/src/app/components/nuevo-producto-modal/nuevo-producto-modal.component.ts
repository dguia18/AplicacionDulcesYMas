import { Component, OnInit, OnChanges, SimpleChanges } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';
import { Producto } from '../../models/producto.model';
import { WhiteSpaceValidator } from '../../Shared/validators/white-space-validator';
import { TipoProducto } from '../../models/enums/tipo-producto.enum';
import { EspecificacionProducto } from '../../models/enums/especificacion-producto.enum';
import { UnidadDeMedidaProducto } from '../../models/enums/unidad-de-medida-producto.enum';
import { ProductoService } from '../../services/producto/producto.service';
import { CategoriaService } from '../../services/categoria.service';
import { SubCategoria } from '../../models/sub-categoria';
import { ResponseHttp } from '../../models/response.model';

@Component({
	selector: 'app-nuevo-producto-modal',
	templateUrl: './nuevo-producto-modal.component.html',
	styleUrls: ['./nuevo-producto-modal.component.css']
})
export class NuevoProductoModalComponent implements OnInit {
	nuevoProductoForm: FormGroup;
	producto: Producto;
	subCategorias: SubCategoria[] = [];
	emboltorios: Producto[];
	public tipoDeProducto = TipoProducto;
	public tipoDeEspecificacion = EspecificacionProducto;
	public tipoDeUnidadDeMedida = UnidadDeMedidaProducto;
	public mensaje: string;
	public success = false;
	public error = false;
	tiposDeUnidadDeMedida = [];
	tiposDeProducto = [];
	tiposDeEspecificacion = [];
	keys = Object.keys;

	ngOnInit(): void {
		this.onChangesTipoProducto();
		this.onChangesEspecificacionProducto();
	}
	private onChangesTipoProducto(): void {
		this.nuevoProductoForm.get('tipo').valueChanges
			.subscribe(tipo => {
				if (Number(tipo) !== this.tipoDeProducto['Para Vender']) {
					this.nuevoProductoForm.get('emboltorio').reset();
					this.nuevoProductoForm.get('emboltorio').disable();
				} else {
					this.nuevoProductoForm.get('emboltorio').enable();
				}
			});
	}
	private onChangesEspecificacionProducto(): void {
		this.nuevoProductoForm.get('especificacionProducto').valueChanges
			.subscribe(esp => {
				if (Number(esp) !== EspecificacionProducto['Tiene Envoltorio']) {
					this.nuevoProductoForm.get('emboltorio').reset();
					this.nuevoProductoForm.get('emboltorio').disable();
				} else {
					this.nuevoProductoForm.get('emboltorio').enable();
				}
			});
	}
	constructor(private formBuilder: FormBuilder, private productoService: ProductoService,
		private categoriaService: CategoriaService) {
		this.buildNuevoProductoForm();
		this.inicializarCombos();
		this.cargarSubCategorias();
		this.getEmboltorios();
	}

	private buildNuevoProductoForm(): void {
		this.nuevoProductoForm = this.formBuilder.group({
			nombreProducto: ['', [Validators.required]],
			tipo: ['', [Validators.required]],
			especificacionProducto: ['', [Validators.required]],
			unidadDeMedidaProducto: ['', [Validators.required]],
			subCategoria: ['', [Validators.required]],
			emboltorio: [''],
			cantidadProducto: [''],
			costoUnitarioProducto: [''],
			porcentajeDeUtilidadProducto: [''],
		});
	}
	private inicializarCombos() {
		this.tiposDeProducto = Object.keys(this.tipoDeProducto).filter(k => !isNaN(Number(k)));
		this.tiposDeEspecificacion = Object.keys(this.tipoDeEspecificacion).filter(k => !isNaN(Number(k)));
		this.tiposDeUnidadDeMedida = Object.keys(this.tipoDeUnidadDeMedida).filter(k => !isNaN(Number(k)));
	}
	private cargarSubCategorias(): void {
		this.categoriaService.getSubCategorias()
			.subscribe(response => {
				this.subCategorias = response.data as SubCategoria[];
			});
	}
	private getEmboltorios() {
		this.productoService.getProductosPorCategoria(3).subscribe(
			response => {
				this.emboltorios = response;
			}, error => console.log(error)

		);
	}
	guardar(): void {
		if (this.nuevoProductoForm.valid) {
			const producto = this.mapProductoForm();
			this.productoService.guardar(producto).subscribe(response => {
				this.mensaje = response.mensaje;
				this.error = false;
				this.success = true;
			}, error => {
				this.mensaje = error;
				this.success = false;
				this.error = true;
			});


		}
	}

	private mapProductoForm() {
		return new Producto(
			this.nuevoProductoForm.get('nombreProducto').value,
			Number(this.nuevoProductoForm.get('unidadDeMedidaProducto').value),
			Number(this.nuevoProductoForm.get('especificacionProducto').value),
			Number(this.nuevoProductoForm.get('tipo').value),
			this.nuevoProductoForm.get('subCategoria').value,
			0,
			null,
			new Date(),
			Number(this.nuevoProductoForm.get('cantidadProducto').value),
			Number(this.nuevoProductoForm.get('costoUnitarioProducto').value),
			Number(this.nuevoProductoForm.get('porcentajeDeUtilidadProducto').value), null,
			null, Number(this.nuevoProductoForm.get('emboltorio').value)
		);
	}
}
