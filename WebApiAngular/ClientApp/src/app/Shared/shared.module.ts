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
import { DataTableComponent } from '../Shared/data-table/data-table.component';

@NgModule({
	declarations: [
		SidebarComponent,
		NopagefoundComponent,
		HeaderComponent,
		FooterComponent,
		AreaComponent,
		DataTableComponent
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
		AreaComponent,
		DataTableComponent
	]
})
export class SharedModule { }
