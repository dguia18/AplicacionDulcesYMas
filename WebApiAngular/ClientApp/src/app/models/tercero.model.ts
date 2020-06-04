import { TerceroContacto } from './terceroContacto.model';
import { TerceroUsuario } from './terceroUsuario.model';
export class Tercero {

	constructor(
		public razonSocialTercero?: string,
		public nitTercero?: string,
		public contactosTercero?: TerceroContacto[],
		public fechaCreacion?: Date,
		public usuarios?: TerceroUsuario[],
		public _id?: string
	) { }

}
