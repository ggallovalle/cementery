import { Component } from '@angular/core';

import { AppRoute } from '@shared/types';
@Component({
  template: ` <ul>
      <li *ngFor="let route of routes" [routerLink]="route.path">
        Go to: {{ route.display }}
      </li>
    </ul>
    <router-outlet></router-outlet>`,
})
export class TemplateComponent {
  routes: Array<AppRoute> = [
    {
      path: 'ng-for',
      display: '*ngFor',
    },
  ];
}
