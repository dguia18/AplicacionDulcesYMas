import { TerceroContacto } from './terceroContacto.model';
import { TerceroUsuario } from './terceroUsuario.model';
export class Tercero {

	constructor(		
		public razonSocial?: string,
		public nit?: string,
		public contactos?: TerceroContacto[],
		public fechaCreacion?: Date,
		public usuarios?: TerceroUsuario[],
		public _id?: string
	) { }

}