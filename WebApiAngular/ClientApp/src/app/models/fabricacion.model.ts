import { EspecificacionProducto } from './enums/especificacion-producto.enum';
import { FabricacionDetalles } from './fabricacion-detalles.model';
export class Fabricacion {
	constructor(
		public id: number,
		public nitEmpleado: string,
		public especificacion: EspecificacionProducto,
		public cantidadDeFabricacion?: number,
		public costoDeFabricacion?: number,
		public detalles?: FabricacionDetalles[],
		public fechaCreacion?: Date
	) { }
}
