import { UnidadDeMedidaProducto } from "./enums/unidad-de-medida-producto.enum";
import { EspecificacionProducto } from "./enums/especificacion-producto.enum";
import { TipoProducto } from './enums/tipo-producto.enum';
import { Fabricacion } from './fabricacion.model';

export class Producto {
	constructor(
		public id: number,
		public nombreProducto: string,
		public unidadDeMedidaProducto: UnidadDeMedidaProducto,
		public especificacion: EspecificacionProducto,
		public tipo: TipoProducto,
		public subcategoria: string,
		public fabricaciones: Fabricacion[], 
		public fechaCreacion?: Date,
		public cantidadProducto?: number,
		public costoUnitarioProducto?: number,
		public porcentajeDeUtilidadProducto?: number,

	) {}
}
