import { Router } from "express";
import UsuarioController from "./../controller/usuario.controller"
const usuario = Router();

usuario.post('/auth', UsuarioController.getInstance().auth);
usuario.post('/recovery', UsuarioController.getInstance().recoveryPassword);
usuario.put('/resetpassword/:id', UsuarioController.getInstance().updatePassword);
usuario.get('/usuario', UsuarioController.getInstance().getAll);
usuario.get('/usuario/admin', UsuarioController.getInstance().getAllAdmin);
usuario.get('/usuario/auxiliar', UsuarioController.getInstance().getAllAuxiliar);
usuario.get('/usuario/estudiante', UsuarioController.getInstance().getAllEstudiante);
usuario.get('/usuario/:id', UsuarioController.getInstance().getSingle);
usuario.post('/usuario', UsuarioController.getInstance().create);
usuario.put('/usuario/:id', UsuarioController.getInstance().update);
usuario.delete('/usuario/:id', UsuarioController.getInstance().delete);

export default usuario;