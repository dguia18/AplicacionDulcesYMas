import { Producto } from './producto.model';
export class CompraDetalle {
	constructor(
		public valor: number,
		public cantidad: number,
		public productoId: number,
		public producto?: Producto
	) { }
}
