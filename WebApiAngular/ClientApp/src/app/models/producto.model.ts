import { UnidadDeMedidaProducto } from './enums/unidad-de-medida-producto.enum';
import { EspecificacionProducto } from './enums/especificacion-producto.enum';
import { TipoProducto } from './enums/tipo-producto.enum';
import { Fabricacion } from './fabricacion.model';
import { SubCategoria } from './sub-categoria';

export class Producto {
	constructor(
		public nombreProducto: string,
		public unidadDeMedidaProducto: UnidadDeMedidaProducto,
		public especificacion: EspecificacionProducto,
		public tipo: TipoProducto,
		public idSubCategoria: number,
		public id?: number,
		public fabricaciones?: Fabricacion[],
		public fechaCreacion?: Date,
		public cantidadProducto?: number,
		public costoUnitarioProducto?: number,
		public porcentajeDeUtilidadProducto?: number,
		public subCategoriaProducto?: SubCategoria
	) { }
}
