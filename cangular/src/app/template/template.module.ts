import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { TemplateRoutingModule } from './template-routing.module';
import { TemplateComponent } from './template.component';
import { NgForComponent } from './components/ng-for.component';

@NgModule({
  declarations: [TemplateComponent, NgForComponent],
  imports: [CommonModule, TemplateRoutingModule],
})
export class TemplateModule {}
