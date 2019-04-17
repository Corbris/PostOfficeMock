import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { PackageGraphComponent } from './package-graph.component';

describe('PackageGraphComponent', () => {
  let component: PackageGraphComponent;
  let fixture: ComponentFixture<PackageGraphComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ PackageGraphComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(PackageGraphComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
