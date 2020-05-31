import { Component, OnInit, Input, Output, EventEmitter } from '@angular/core';
import { FormGroup, FormControl, Validators, FormBuilder } from '@angular/forms';
import { Router } from '@angular/router';
import { TerceroUsuario } from '../models/terceroUsuario.model';
import { AuthService } from '../services/auth/auth.service';

@Component({
	selector: 'app-login',
	templateUrl: './login.component.html',
	styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {
	form: FormGroup;
	public loginError: string;
	public loginInvalid: boolean;

	constructor(
		private formBuilder: FormBuilder, private authService: AuthService,
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
		if (submittedForm.valid) {
			try {
				const username = this.form.get('username').value;
				const password = this.form.get('password').value;
				const usuario = new TerceroUsuario(username, password);
				this.authService.login(usuario).subscribe(response => {
					this.router.navigate(['/dashboard']);
				}, error => this.loginError = error);
			} catch (err) {
				this.loginInvalid = true;
			}
		}
	}
}
