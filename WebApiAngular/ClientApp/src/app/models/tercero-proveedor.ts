import { Tercero } from './tercero.model';
export class TerceroProveedor {
	constructor(
		public tercero: Tercero,
		public nitTercero: number,
		public fechaCreacion: Date
	) { }
}
