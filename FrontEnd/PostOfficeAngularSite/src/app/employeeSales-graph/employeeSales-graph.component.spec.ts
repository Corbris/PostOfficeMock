import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { EmlpoyeeGraphComponent } from './emlpoyee-graph.component';

describe('EmlpoyeeGraphComponent', () => {
  let component: EmlpoyeeGraphComponent;
  let fixture: ComponentFixture<EmlpoyeeGraphComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ EmlpoyeeGraphComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(EmlpoyeeGraphComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
