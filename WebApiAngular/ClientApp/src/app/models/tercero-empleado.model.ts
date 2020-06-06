import { Tercero } from './tercero.model';
export class TerceroEmpleado {
	constructor(
		public tercero?: Tercero,
		public nitTercero?: string,
		public fechaCreacion?: Date
	) { }
}
