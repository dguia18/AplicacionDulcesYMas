import { EspecificacionProducto } from './enums/especificacion-producto.enum';
import { FabricacionDetalles } from './fabricacion-detalles.model';
import { TerceroEmpleado } from './tercero-empleado.model';
export class Fabricacion {
	public detalles?: FabricacionDetalles[];
	constructor(
		public id?: number,
		public nitEmpleado?: string,
		public especificacion?: EspecificacionProducto,
		public terceroEmpleado?: TerceroEmpleado,
		public idProducto?: number,
		public cantidadDeFabricacion?: number,
		public costoDeFabricacion?: number,
		public fechaCreacion?: Date
	) {
		this.detalles = [];
	}
}
