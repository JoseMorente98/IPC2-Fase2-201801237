import { Component, OnInit } from '@angular/core';
import { ReporteService } from 'src/app/_service/reporte.service';
import { NotificationsService } from 'angular2-notifications';
import { CursoService } from 'src/app/_service/curso.service';
import { SeccionService } from 'src/app/_service/seccion.service';

@Component({
  selector: 'app-con-asignacion',
  templateUrl: './con-asignacion.component.html',
  styleUrls: ['./con-asignacion.component.scss']
})
export class ConAsignacionComponent implements OnInit {
  table:any[];
  cursos:any[];
  secciones:any[];
  data = {
    idCurso : '',
    semestre : '',
    anio : '',
    idSeccion : '',
    horaInicio : '',
    horaFin : '',
  }
  public options = {
    position: ["bottom", "right"],
    timeOut: 2000,
    showProgressBar: false,
    pauseOnHover: true,
    clickToClose: true,
    lastOnBottom: false,
    preventDuplicates: true,
    animate: "scale",
    maxLength: 400
  };

  constructor(
    private reporteService: ReporteService,
    private notificationsService: NotificationsService,
    private cursosService: CursoService,
    private seccionService: SeccionService
  ) { }

  ngOnInit() {
    this.getAll();
    this.getAllSecciones();
  }

  consultar() {
    this.create(this.data);
  }

  create(data:any) {
    this.reporteService.getReporte1(data)
    .subscribe((res) => {
     console.log(res);
     this.table = [];
     this.table = res;
    }, (error) => {
      console.log(error);
      this.notificationsService.error('Error D:', 'Ha ocurrido un error intente más tarde.');
    })
  }

  getAll() {
    this.cursosService.getAll()
    .subscribe((res) => {
      this.cursos = [];
      console.log(res);
      this.cursos = res;
    }, (error) => {
      console.log(error);
    })
  }

  getAllSecciones() {
    this.seccionService.getAll()
    .subscribe((res) => {
      this.secciones = [];
      console.log(res);
      this.secciones = res;
    }, (error) => {
      console.log(error);
    })
  }

}
