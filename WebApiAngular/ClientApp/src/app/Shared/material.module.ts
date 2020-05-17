import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MatButtonModule } from '@angular/material/button';
import {
	MatSidenavModule,
	MatDividerModule,
	MatToolbarModule,
	MatIconModule,
	MatMenuModule,
	MatListModule
} from '@angular/material';

@NgModule({
	declarations: [
	],
	imports: [
		CommonModule,
	],
	exports: [
		MatButtonModule,
		MatSidenavModule,
		MatDividerModule,
		MatToolbarModule,
		MatIconModule,
		MatMenuModule,
		MatListModule
	]
})
export class MaterialModule { }
