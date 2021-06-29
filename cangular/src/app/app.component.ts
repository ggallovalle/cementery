import { Component } from '@angular/core';
import { AppRoute } from '@shared/types';

@Component({
  selector: 'cangular-root',
  template: `
    <ul>
      <li *ngFor="let route of routes" [routerLink]="route.path">
        Go to: {{ route.display }}
      </li>
    </ul>
    <router-outlet></router-outlet>
  `,
})
export class AppComponent {
  title = 'cangular';

  routes: Array<AppRoute> = [
    {
      display: 'Home',
      path: '',
    },
    {
      display: 'Template',
      path: 'template',
    },
  ];
}
