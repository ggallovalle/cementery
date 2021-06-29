import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { NgForComponent } from './components/ng-for.component';
import { TemplateComponent } from './template.component';

const routes: Routes = [
  {
    path: '',
    component: TemplateComponent,
    children: [
      {
        path: 'ng-for',
        component: NgForComponent,
      },
    ],
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class TemplateRoutingModule {}
