import { Tercero } from './tercero.model';
import { Role } from './role.model';

export class TerceroUsuario {

	constructor(
		public usuarioTercero: string,
		public passwordTercero: string,
		public tercero?: Tercero,
		public role?: Role,
		public fechaCreacion?: Date,
		public _id?: string
	) { }

}

