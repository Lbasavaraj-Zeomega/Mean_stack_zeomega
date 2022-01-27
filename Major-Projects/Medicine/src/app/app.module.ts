import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HeaderComponent } from './header/header.component';
import { AddMedicineComponent } from './admin/add-medicine/add-medicine.component';
import { AddMedicineqtyComponent } from './admin/add-medicineqty/add-medicineqty.component';
import { AdminNavComponent } from './admin/admin-nav/admin-nav.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    AddMedicineComponent,
    AddMedicineqtyComponent,
    AdminNavComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
