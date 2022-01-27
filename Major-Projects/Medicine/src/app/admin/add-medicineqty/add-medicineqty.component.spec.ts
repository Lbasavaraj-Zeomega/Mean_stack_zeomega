import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AddMedicineqtyComponent } from './add-medicineqty.component';

describe('AddMedicineqtyComponent', () => {
  let component: AddMedicineqtyComponent;
  let fixture: ComponentFixture<AddMedicineqtyComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AddMedicineqtyComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AddMedicineqtyComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
