import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardStudentComponent } from './dashboard-student/dashboard-student.component';
import { StudentComponent } from './student.component';
import { MisCursosStudentComponent } from './mis-cursos-student/mis-cursos-student.component';
import { MensajeStudentComponent } from './mensaje-student/mensaje-student.component';
import { ForoStudentComponent } from './foro-student/foro-student.component';
import { ForoDetailStudentComponent } from './foro-detail-student/foro-detail-student.component';
import { CursosStudentComponent } from './cursos-student/cursos-student.component';
import { TicketStudentComponent } from './ticket-student/ticket-student.component';
import { EvaluacionStudentComponent } from './evaluacion-student/evaluacion-student.component';
import { EvaluacionDetalleStudentComponent } from './evaluacion-detalle-student/evaluacion-detalle-student.component';

const routes: Routes = [
  { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
  { path: '', component: StudentComponent, children: [
    { path: 'dashboard', component: DashboardStudentComponent},
    { path: 'cursos', component: CursosStudentComponent},
    { path: 'mis-cursos', component: MisCursosStudentComponent},
    { path: 'mensaje', component: MensajeStudentComponent},
    { path: 'ticket', component: TicketStudentComponent},
    { path: 'foro/:id', component: ForoStudentComponent},
    { path: 'foro/detail/:id', component: ForoDetailStudentComponent},
    { path: 'evaluacion/:id', component: EvaluacionStudentComponent},
    { path: 'evaluacion/detail/:id', component: EvaluacionDetalleStudentComponent},
    /*{ path: 'producto', component: ProductoAdminComponent, canActivate: [AuthGuard] },
    { path: 'proveedor', component: ProveedorAdminComponent, canActivate: [AuthGuard] },
    { path: 'usuario', component: UsuarioAdminComponent, canActivate: [AuthGuard] },
    { path: 'reporte', component:  ReportesAdminComponent, canActivate: [AuthGuard] },
    { path: 'reporte/:id', component:  ReportesAdminComponent, canActivate: [AuthGuard] },/** */
    //{ path: 'category', component: CategoryComponent },
    //{ path: 'subcategory', component: SubcategoryComponent },
   // { path: 'product', component: ProductComponent },
  ]},
  { path: '**', redirectTo: 'dashboard', pathMatch: 'full' }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class StudentRoutingModule { }
