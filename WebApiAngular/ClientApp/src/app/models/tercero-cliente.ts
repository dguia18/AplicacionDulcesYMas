import { Tercero } from './tercero.model';
import { PrecioCliente } from './precio-cliente';
export class TerceroCliente {
	constructor(
		public tercero: Tercero,
		public precios?: PrecioCliente[],
		public fechaCreacion?: Date
	) { }
}
