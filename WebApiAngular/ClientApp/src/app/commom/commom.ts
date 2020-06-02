import { HttpErrorResponse } from '@angular/common/http';
import { throwError } from 'rxjs';


export function transformError(error: HttpErrorResponse | string) {
	let errorMensaje = 'Ha ocurrido un error desconocido';
	if (typeof error === 'string') {
		errorMensaje = error;
	} else if (error instanceof HttpErrorResponse) {
		errorMensaje = `Error: ${error.error || error.message}`;
	}// else if (error.status) {
	// 	errorMensaje = `Error de request con ${error.status}`;
	// }
	return throwError(errorMensaje);
}
