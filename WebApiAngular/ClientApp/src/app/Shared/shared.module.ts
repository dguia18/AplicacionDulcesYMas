import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SidebarComponent } from './sidebar/sidebar.component';
import { HeaderComponent } from './header/header.component';
import { NopagefoundComponent } from './nopagefound/nopagefound.component';
import { FooterComponent } from './footer/footer.component';
import { MaterialModule } from './material.module';
import { FlexLayoutModule } from '@angular/flex-layout';
import { RouterModule } from '@angular/router';
import { AreaComponent } from './widgets/area/area.component';
import { HighchartsChartModule } from 'highcharts-angular';

@NgModule({
	declarations: [
		SidebarComponent,
		NopagefoundComponent,
		HeaderComponent,
		FooterComponent,
		AreaComponent
	],
	imports: [
		CommonModule,
		MaterialModule,
		FlexLayoutModule,
		RouterModule,
		HighchartsChartModule
	],
	exports: [
		SidebarComponent,
		NopagefoundComponent,
		HeaderComponent,
		FooterComponent,
		MaterialModule,
		AreaComponent
	]
})
export class SharedModule { }
