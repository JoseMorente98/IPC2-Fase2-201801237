"use strict";
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
var mysql_1 = __importDefault(require("./../mysql/mysql"));
var nodemailer = require('nodemailer');
var UsuarioController = /** @class */ (function () {
    function UsuarioController() {
        this.getAll = function (req, res) {
            var query = "\n            SELECT Usuario.idUsuario, Usuario.carnet, Usuario.dpi, Usuario.nombre, Usuario.apellido, Usuario.email \n            FROM Usuario\n        ";
            mysql_1.default.getQuery(query, function (err, data) {
                if (err) {
                    res.json([]);
                }
                else {
                    res.json(data);
                }
            });
        };
        this.getAllAdmin = function (req, res) {
            var query = "\n            SELECT Usuario.idUsuario, Usuario.carnet, Usuario.dpi, Usuario.nombre, Usuario.apellido, Usuario.email,\n            TipoUsuario.nombre as 'tipo'\n            FROM DetalleUsuario\n            INNER JOIN Usuario ON DetalleUsuario.idUsuario = Usuario.idUsuario\n            INNER JOIN TipoUsuario ON DetalleUsuario.idTipoUsuario = TipoUsuario.idTipoUsuario\n            WHERE TipoUsuario.idTipoUsuario = 1;\n        ";
            mysql_1.default.getQuery(query, function (err, data) {
                if (err) {
                    res.json([]);
                }
                else {
                    res.json(data);
                }
            });
        };
        this.getAllAuxiliar = function (req, res) {
            var query = "\n            SELECT Usuario.idUsuario, Usuario.carnet, Usuario.dpi, Usuario.nombre, Usuario.apellido, Usuario.email,\n            TipoUsuario.nombre as 'tipo'\n            FROM DetalleUsuario\n            INNER JOIN Usuario ON DetalleUsuario.idUsuario = Usuario.idUsuario\n            INNER JOIN TipoUsuario ON DetalleUsuario.idTipoUsuario = TipoUsuario.idTipoUsuario\n            WHERE TipoUsuario.idTipoUsuario = 2;\n        ";
            mysql_1.default.getQuery(query, function (err, data) {
                if (err) {
                    res.json([]);
                }
                else {
                    res.json(data);
                }
            });
        };
        this.getAllEstudiante = function (req, res) {
            var query = "\n            SELECT Usuario.idUsuario, Usuario.carnet, Usuario.dpi, Usuario.nombre, Usuario.apellido, Usuario.email,\n            TipoUsuario.nombre as 'tipo'\n            FROM DetalleUsuario\n            INNER JOIN Usuario ON DetalleUsuario.idUsuario = Usuario.idUsuario\n            INNER JOIN TipoUsuario ON DetalleUsuario.idTipoUsuario = TipoUsuario.idTipoUsuario\n            WHERE TipoUsuario.idTipoUsuario = 3;\n        ";
            mysql_1.default.getQuery(query, function (err, data) {
                if (err) {
                    res.json([]);
                }
                else {
                    res.json(data);
                }
            });
        };
        this.getSingle = function (req, res) {
            var query = "\n            SELECT *\n            FROM Usuario WHERE idUsuario = ?;\n        ";
            var body = {
                idUsuario: req.params.id
            };
            mysql_1.default.sendQuery(query, body.idUsuario, function (err, data) {
                if (err) {
                    res.status(400).json({
                        ok: false,
                        status: 400,
                        error: err
                    });
                }
                else {
                    res.json(data[0]);
                }
            });
        };
        this.create = function (req, res) {
            var query = "\n            CALL SP_CreateUsuario(?, ?, ?, ?, ?, ?, ?);\n        ";
            var body = {
                carnet: req.body.carnet,
                dpi: req.body.dpi,
                email: req.body.email,
                password: req.body.password,
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                idTipoUsuario: req.body.idTipoUsuario,
            };
            mysql_1.default.sendQuery(query, [body.carnet, body.dpi, body.email, body.password, body.nombre, body.apellido, body.idTipoUsuario], function (err, data) {
                if (err) {
                    res.status(400).json({
                        ok: false,
                        status: 400,
                        error: err
                    });
                }
                else {
                    res.json({
                        ok: true,
                        status: 200
                    });
                }
            });
        };
        this.auth = function (req, res) {
            var query = "\n            CALL SP_Autenticar(?, ?);\n        ";
            var body = {
                email: req.body.email,
                password: req.body.password
            };
            mysql_1.default.sendQuery(query, [body.email, body.password], function (err, data) {
                if (err) {
                    res.status(400).json({
                        ok: false,
                        status: 400,
                        error: err
                    });
                }
                else {
                    console.log(data[0]);
                    res.json(data[0]);
                }
            });
        };
        this.update = function (req, res) {
            var data = {
                id: req.params.id,
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                email: req.body.email,
                password: req.body.password,
                dpi: req.body.dpi,
                carnet: req.body.carnet,
            };
            var query = "\n            UPDATE Usuario SET nombre = ?, apellido = ?, email = ?,\n                password = ?, dpi = ?, carnet = ?\n                WHERE idUsuario = ?;\n        ";
            mysql_1.default.sendQuery(query, [data.nombre, data.apellido, data.email, data.password, data.dpi, data.carnet, data.id], function (err, data) {
                if (err) {
                    res.status(400).json({
                        ok: false,
                        status: 400,
                        error: err
                    });
                }
                else {
                    res.json({
                        ok: true,
                        status: 200
                    });
                }
            });
        };
        this.updatePassword = function (req, res) {
            var data = {
                id: req.params.id,
                password: req.body.password,
            };
            var query = "\n            UPDATE Usuario SET password = ?, estado = 0\n                WHERE idUsuario = ?;\n        ";
            mysql_1.default.sendQuery(query, [data.password, data.id], function (err, data) {
                if (err) {
                    res.status(400).json({
                        ok: false,
                        status: 400,
                        error: err
                    });
                }
                else {
                    res.json({
                        ok: true,
                        status: 200
                    });
                }
            });
        };
        this.delete = function (req, res) {
            var id = req.params.id;
            var query = "\n            DELETE FROM Usuario WHERE idUsuario = ?;\n        ";
            mysql_1.default.sendQuery(query, id, function (err, data) {
                if (err) {
                    res.status(400).json({
                        ok: false,
                        status: 400,
                        error: err
                    });
                }
                else {
                    res.json({
                        ok: true,
                        status: 200,
                    });
                }
            });
        };
        this.recoveryPassword = function (req, res) {
            var data1 = {
                email: req.body.email
            };
            var query = "\n            CALL SP_RecoveryPassword(?);\n        ";
            mysql_1.default.sendQuery(query, [data1.email], function (err, data) {
                if (err) {
                    res.status(400).json({
                        ok: false,
                        status: 400,
                        error: err
                    });
                }
                else {
                    //console.log(JSON.parse(JSON.stringify(data[0])))
                    var dataQuery = JSON.parse(JSON.stringify(data[0]));
                    //console.log("QUERY ",dataQuery[0])
                    if (dataQuery[0]._existe == '0') {
                        res.status(400).json({
                            ok: false,
                            status: 400
                        });
                    }
                    else {
                        var transporter = nodemailer.createTransport({
                            service: 'Gmail',
                            auth: {
                                user: 'josemorenteg98@gmail.com',
                                pass: 'rvliefzecigjpgjw'
                            }
                        });
                        transporter.sendMail({
                            from: '"Administrador USAC" <josemorenteg98@gmail.com>',
                            to: 'josemorenteg98@gmail.com',
                            subject: 'Recuperación de Contraseña',
                            text: 'Recuperación de Contraseña',
                            html: "\n                        <body style=\"font-family: Arial;\">\n                        <div style=\"text-align: center;\">\n                            <h1>Hola " + JSON.parse(JSON.stringify(data[0]))[0].nombre + " " + JSON.parse(JSON.stringify(data[0]))[0].apellido + "</h1>\n                            <p>Recientemente hemos recibido una solicitud para cambiar tu contrase\u00F1a. Tu correo es:</p>\n                            <p style=\"background-color: #4CAF50;\n                            border: none;\n                            color: white;\n                            padding: 15px 32px;\n                            text-align: center;\n                            text-decoration: none;\n                            display: inline-block;\n                            font-size: 16px;\">" + JSON.parse(JSON.stringify(data[0]))[0].email + "</p>\n                            <p>Tu nueva contrase\u00F1a es:</p>\n                            <p style=\"background-color: #4CAF50; \n                            border: none;\n                            color: white;\n                            padding: 15px 32px;\n                            text-align: center;\n                            text-decoration: none;\n                            display: inline-block;\n                            font-size: 16px;\">usac12345</p>            \n                        </div>\n                        </body>"
                        }, function (error, info) {
                            if (error) {
                                console.log(error);
                                res.json({
                                    ok: false,
                                    status: 500,
                                    err: error
                                });
                            }
                            else {
                                console.log("Correo Enviado :D");
                                res.json({
                                    ok: false,
                                    status: 200,
                                    data: info
                                });
                            }
                        });
                    }
                }
            });
        };
    }
    UsuarioController.getInstance = function () {
        return this._instance || (this._instance = new this());
    };
    return UsuarioController;
}());
exports.default = UsuarioController;
