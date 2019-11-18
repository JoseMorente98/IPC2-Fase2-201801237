import { Component, OnInit } from '@angular/core';
import { AsignacionEstudianteService } from 'src/app/_service/asignacion-estudiante.service';
import { CursoDetalleService } from 'src/app/_service/curso-detalle.service';
import { NotificacionService } from 'src/app/_service/notificacion.service';

@Component({
  selector: 'app-curso-estudiante',
  templateUrl: './curso-estudiante.page.html',
  styleUrls: ['./curso-estudiante.page.scss'],
})
export class CursoEstudiantePage implements OnInit {
  search:any;
  table:any[];
  
  constructor(
    private asignacionStudentService: AsignacionEstudianteService,
    private cursoDetalleService: CursoDetalleService,
    private notificationsService: NotificacionService
  ) { }

  ngOnInit() {
    this.getAll()
  }

  getAll() {
    this.cursoDetalleService.getAll()
    .subscribe((res) => {
      this.table = [];
      console.log(res);
      this.table = res;
    }, (error) => {
      console.log(error);
    })
  }

  create(data:any) {
    this.asignacionStudentService.create(data)
    .subscribe((res) => {
      console.log(res.res[0]._existe)
      if(res.res[0]._existe==0) {
        this.notificationsService.alertMessage('Exito :D', 'Curso agregado con éxito.');
      } else if(res.res[0]._existe==1) {
        this.notificationsService.alertMessage('Alerta D:', 'Ya no puedes asignarte ha finalizado el tiempo de asignación.');
      } else {
        this.notificationsService.alertMessage('Advertencia D:', 'No puede asignarse al mismo curso varias veces.');
      }
      //this.getAll();*/
    }, (error) => {
      console.log(error);
      this.notificationsService.alertToast('Ha ocurrido un error intente más tarde.');
    })
  }

  saveChanges(id:number) {
    let data = {
      idAsignacionAuxiliar: id,
      idUsuario: localStorage.getItem('currentId'),
    }
    this.create(data);
  }

}
