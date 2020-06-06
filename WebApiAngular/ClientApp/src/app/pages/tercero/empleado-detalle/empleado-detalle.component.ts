import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TerceroService } from '../../../services/terceros/tercero.service';
import { TerceroEmpleado } from '../../../models/tercero-empleado.model';
import { Observable, from } from 'rxjs';
import { TerceroContacto } from '../../../models/terceroContacto.model';

@Component({
	selector: 'app-empleado-detalle',
	templateUrl: './empleado-detalle.component.html',
	styleUrls: ['./empleado-detalle.component.css']
})
export class EmpleadoDetalleComponent implements OnInit {
	public empleado: TerceroEmpleado;


	constructor(private route: ActivatedRoute, private terceroService: TerceroService) { }

	ngOnInit(): void {
		this.route.params.subscribe(params => {
			this.getEmpleado(+params['id']);
		});
	}
	private getEmpleado(id: number): void {
		this.terceroService.getEspecificacionTercero(id, 'empleados')
			.subscribe(response => {
				this.empleado = response.data as TerceroEmpleado;
			}, error => console.log(error));
	}

}
