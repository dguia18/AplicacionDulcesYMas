import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators, FormArray, FormControl } from '@angular/forms';
import { Compra } from '../../models/compra.model';
import { TerceroService } from '../../services/terceros/tercero.service';
import { CompraService } from '../../services/compra/compra.service';
import { TerceroProveedor } from '../../models/tercero-proveedor';
import { Observable } from 'rxjs';
import { ProductoService } from '../../services/producto/producto.service';
import { TipoProducto } from 'src/app/models/enums/tipo-producto.enum';
import { Producto } from '../../models/producto.model';
import { CompraDetalle } from 'src/app/models/compra-detalle.model';
import { IHeaderTemplate, IInformationTemplate } from '../../Shared/data-table/data-table.component';

@Component({
	selector: 'app-nueva-compra-modal',
	templateUrl: './nueva-compra-modal.component.html',
	styleUrls: ['./nueva-compra-modal.component.css']
})
export class NuevaCompraModalComponent implements OnInit {
	nuevaCompraForm: FormGroup;
	compra: Compra;
	detalleForm: FormControl;
	proveedores: TerceroProveedor[];
	productos: Producto[];
	mensaje: string;
	classAlert: string;
	informationDataTable: IInformationTemplate = {
		title: 'Detalles de compra', subTitle: ''
	};
	headerDetalles: IHeaderTemplate[] = [
		{ text: 'Producto', value: 'productoId' },
		{ text: 'Cantidad', value: 'cantidad' },
		{ text: 'Valor', value: 'valor' }];
	constructor(private formBuilder: FormBuilder, private terceroService: TerceroService,
		private compraService: CompraService, private productoService: ProductoService) { }
	get controls() {
		return this.nuevaCompraForm.controls;
	}
	ngOnInit(): void {
		this.buildNuevaCompraForm();
		this.getProveedores();
		this.getMateriasPrimas();
		this.compra = new Compra();
		this.compra.detalles = [];
	}
	private buildNuevaCompraForm(): void {
		this.nuevaCompraForm = this.formBuilder.group({
			proveedor: ['', [Validators.required]],
			valor: ['', [Validators.required, Validators.min(1)]],
			producto: ['', [Validators.required]],
			cantidad: ['', [Validators.required, Validators.min(1)]]
		});
	}
	private getProveedores(): void {
		this.terceroService.getEspecificacionesTercero('proveedores')
			.subscribe(response => {
				this.proveedores = response.data as TerceroProveedor[];
			});
	}
	private getMateriasPrimas(): void {
		this.productoService.getProductosPorTipo(TipoProducto['Materia Prima'])
			.subscribe(response => {
				this.productos = response.data as Producto[];
			});
	}
	public agregarDetalle(): void {
		this.compra.detalles.push(new CompraDetalle(
			this.controls.valor.value,
			this.controls.cantidad.value,
			this.controls.producto.value));
		this.nuevaCompraForm.reset();
		console.log(this.compra.detalles);

	}
	public guardar(): void {
		this.compraService.addCompra(this.compra)
			.subscribe(response => {
				this.mensaje = response.mensaje;
				this.classAlert = 'success';
			}, error => {
				this.mensaje = error;
				this.classAlert = 'error';
			});
	}

}
