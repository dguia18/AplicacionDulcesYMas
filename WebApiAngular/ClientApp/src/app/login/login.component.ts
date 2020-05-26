import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { TerceroUsuarioService } from '../services/terceroUsuario/terceroUsuario.service';
import { TerceroUsuario } from '../models/terceroUsuario.model';

@Component({
	selector: 'app-login',
	templateUrl: './login.component.html',
	styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
	form: FormGroup;
	public loginInvalid: boolean;

	constructor(
		private formBuilder: FormBuilder, private usuarioService: TerceroUsuarioService,
		private router: Router
	) {
	}

	async ngOnInit() {
		this.form = this.formBuilder.group({
			username: ['', [Validators.required]],
			password: ['', Validators.required]
		});
	}

	async onSubmit(submittedForm: FormGroup) {

		this.loginInvalid = false;
		if (this.form.valid) {
			try {
				const username = this.form.get('username').value;
				const password = this.form.get('password').value;
				const usuario = new TerceroUsuario(username, password);
				this.usuarioService.login(usuario).subscribe(response => {
					this.router.navigate(['/dashboard']);
				});
			} catch (err) {
				debugger;
				this.loginInvalid = true;
			}
		}
	}
}
