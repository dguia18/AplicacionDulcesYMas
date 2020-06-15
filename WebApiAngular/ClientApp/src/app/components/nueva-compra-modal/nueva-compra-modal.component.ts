import { Component, OnInit, ChangeDetectorRef, ViewChild } from '@angular/core';
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
import { MatTable } from '@angular/material';
import { AuthService } from '../../services/auth/auth.service';

@Component({
	selector: 'app-nueva-compra-modal',
	templateUrl: './nueva-compra-modal.component.html',
	styleUrls: ['./nueva-compra-modal.component.css']
})
export class NuevaCompraModalComponent implements OnInit {
	@ViewChild('table') private table;
	nuevoDetalleForm: FormGroup;
	proveedorControl: FormControl;
	compra: Compra;
	proveedores: TerceroProveedor[];
	productos: Producto[];
	mensaje: string;
	classAlert: string;
	informationDataTable: IInformationTemplate = {
		title: 'Detalles de compra', subTitle: ''
	};
	headerDetalles = ['producto', 'cantidad', 'valor', 'total'];
	constructor(private formBuilder: FormBuilder, private terceroService: TerceroService,
		private compraService: CompraService, private productoService: ProductoService,
		private authService: AuthService) { }
	get controls() {
		return this.nuevoDetalleForm.controls;
	}
	ngOnInit(): void {
		this.buildNuevaCompraForm();
		this.getProveedores();
		this.getMateriasPrimas();
		this.compra = new Compra();
		this.compra.detalles = [];
	}
	private buildNuevaCompraForm(): void {
		this.proveedorControl = this.formBuilder.control('', [Validators.required]);
		this.nuevoDetalleForm = this.formBuilder.group({
			valor: ['', [Validators.required, Validators.min(1)]],
			producto: ['', [Validators.required]],
			cantidad: [0, [Validators.required, Validators.min(1)]]
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
		this.proveedorControl.disable();
		this.compra.detalles.push(new CompraDetalle(
			this.controls.valor.value,
			this.controls.cantidad.value,
			this.controls.producto.value,
			this.productos.find(x => x.id === this.controls.producto.value)
		));
		this.nuevoDetalleForm.reset();
		this.table.renderRows();
	}
	public getCostoTotal(): number {
		return this.compra.detalles.map(t => t.valor * t.cantidad).reduce((acc, value) => acc + value, 0);
	}
	public guardar(): void {
		this.compra.nitProveedor = this.proveedorControl.value;
		this.compra.usuarioId = this.authService.getAuthStatus().primarysid;
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
