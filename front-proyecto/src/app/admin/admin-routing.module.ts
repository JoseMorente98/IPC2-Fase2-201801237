import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { DashboardAdminComponent } from './dashboard-admin/dashboard-admin.component';
import { AdminComponent } from './admin.component';
import { UsuarioAdminComponent } from './usuario-admin/usuario-admin.component';
import { AuxiliarAdminComponent } from './auxiliar-admin/auxiliar-admin.component';
import { StudentAdminComponent } from './student-admin/student-admin.component';
import { CursoComponent } from './curso/curso.component';
import { AsignacionCursoAdminComponent } from './asignacion-curso-admin/asignacion-curso-admin.component';
import { DetailCursoAdminComponent } from './detail-curso-admin/detail-curso-admin.component';
import { TicketAdminComponent } from './ticket-admin/ticket-admin.component';
import { ConAsignacionComponent } from './con-asignacion/con-asignacion.component';
import { Reporte2Component } from './reporte2/reporte2.component';
import { Reporte6Component } from './reporte6/reporte6.component';
import { Reporte3Component } from './reporte3/reporte3.component';
import { Reporte5Component } from './reporte5/reporte5.component';
import { Reporte4Component } from './reporte4/reporte4.component';

const routes: Routes = [
  { path: '', redirectTo: 'dashboard', pathMatch: 'full' },
  { path: '', component: AdminComponent, children: [
    { path: 'dashboard', component: DashboardAdminComponent},
    { path: 'usuario', component: UsuarioAdminComponent},
    { path: 'auxiliar', component: AuxiliarAdminComponent},
    { path: 'estudiante', component: StudentAdminComponent},
    { path: 'curso', component: CursoComponent},
    { path: 'ticket', component: TicketAdminComponent},
    { path: 'detalle-curso', component: AsignacionCursoAdminComponent},
    { path: 'detalle-curso/auxiliar/:id', component: DetailCursoAdminComponent},
    { path: 'reporte1', component: ConAsignacionComponent},
    { path: 'reporte2', component: Reporte2Component},
    { path: 'reporte3', component: Reporte3Component},
    { path: 'reporte4', component: Reporte4Component},
    { path: 'reporte5', component: Reporte5Component},
    { path: 'reporte6', component: Reporte6Component},
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
export class AdminRoutingModule { }
