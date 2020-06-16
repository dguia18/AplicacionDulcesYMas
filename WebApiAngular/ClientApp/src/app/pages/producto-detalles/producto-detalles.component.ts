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
import { IHeaderTemplate, IInformationTemplate } from '../../Shared/data-table/data-table.component';
import { Fabricacion } from 'src/app/models/fabricacion.model';
import { TerceroEmpleado } from 'src/app/models/tercero-empleado.model';
import { Tercero } from 'src/app/models/tercero.model';
import { CurrencyPipe, DatePipe } from '@angular/common';
import { MatDialog } from '@angular/material';
import { NuevaFabricacionModalComponent } from '../../components/nueva-fabricacion-modal/nueva-fabricacion-modal.component';

export interface IFabricacionDataTable {
	id: number;
	empleado: string;
	cantidadDeFabricacion: number;
	costoDeFabricacion: string;
	fechaCreacion: string;
}
@Component({
	selector: 'app-producto-detalles',
	templateUrl: './producto-detalles.component.html',
	styleUrls: ['./producto-detalles.component.css']
})
export class ProductoDetallesComponent implements OnInit {
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
	fabricacionesDataTable: IFabricacionDataTable[] = [];

	headersFabricaciones: IHeaderTemplate[] = [
		{ value: 'empleado', text: 'Empleado' },
		{ value: 'cantidadDeFabricacion', text: 'Cantidad' },
		{ value: 'costoDeFabricacion', text: 'Costo' },
		{ value: 'fechaCreacion', text: 'Fecha' },
		{ value: 'actions', text: 'Actions' },
	];
	informationTable: IInformationTemplate = {
		title: 'Fabricaciones',
		subTitle: 'Información de calderos realizados'
	};
	constructor(private productoService: ProductoService, private route: ActivatedRoute,
		private formBuilder: FormBuilder, private categoriaService: CategoriaService,
		private currencyPipe: CurrencyPipe, private datePipe: DatePipe, private dialog: MatDialog) {

		this.tiposDeProducto = Object.keys(this.tipoDeProducto)
			.filter(k => !isNaN(Number(k)));
		this.tiposDeEspecificacion = Object.keys(this.tipoDeEspecificacion)
			.filter(k => !isNaN(Number(k)));
		this.tiposDeUnidadDeMedida = Object.keys(this.tipoDeUnidadDeMedida)
			.filter(k => !isNaN(Number(k)));
	}

	ngOnInit(): void {
		this.route.params.subscribe(params => {
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
			this.getChildlsProducto();
			this.producto.fabricaciones.push(new Fabricacion(
				1, '123', EspecificacionProducto.Duro, new TerceroEmpleado(new Tercero('Duvan')),
				24, 432123, [], new Date()));

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
	showModalAgregarFabricacion(): void {
		const dialogRef = this.dialog.open(NuevaFabricacionModalComponent, {
			width: '40%', disableClose: true, data: { producto: this.producto }
		});

		dialogRef.afterClosed().subscribe(result => {
			this.getFabricacionesProducto();
		});
	}
	private getChildlsProducto(): void {
		switch (this.producto.tipo) {
			case TipoProducto['Para Fabricar']:
				this.getFabricacionesProducto();
				break;

			default:
				break;
		}
	}
	private getFabricacionesProducto(): void {
		this.productoService.getFabricaciones(this.producto.id)
			.subscribe(response => {
				this.producto.fabricaciones = response;
				this.producto.fabricaciones.map(fabricacion => {
					this.fabricacionesDataTable.push(
						{
							cantidadDeFabricacion: fabricacion.cantidadDeFabricacion,
							costoDeFabricacion: this.currencyPipe.transform(fabricacion.costoDeFabricacion),
							empleado: fabricacion.empleado.tercero.razonSocialTercero,
							fechaCreacion: this.datePipe.transform(fabricacion.fechaCreacion),
							id: fabricacion.id
						});
				});
			});
	}
	verDetallesDeFabricacion(item: any): void {
		console.log(item);
	}
}
