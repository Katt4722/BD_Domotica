INSERT INTO Usuario (idUsuario, Nombre, Correo, contrasenia, Telefono)
         	VALUES (1, 'Hernan', 'hernan276@gmail.com', 45459345, '1128641065'),
                	(2, 'Joel', 'joeltito160@gmail,com', 54583706, '1109237521'),
                	(3, 'Karen', 'karenmejia01@gmail.com', 79435345, '1138027135'),
                	(4, 'Jenni', 'jenni403@gmail.com', 4589027257, '1109825638'),
                	(5, 'Cheng', 'leonardocheng@gmail.com', 743956310, '1167230914');
INSERT INTO Casa (idCasa, Direccion)
      	VALUES (1, 'Cerviño 336'),
             	(2, 'Libertador 284'),
             	(3, 'Lavalle 425'),
             	(4, 'Esmeralda 527'),
             	(5, 'Florida 327');
INSERT INTO casaUsuario (idCasa, idUsuario)
             	VALUES (1, 1),
                    	(2, 2),
                    	(3, 3),
                    	(4, 4),
                    	(5, 5);

