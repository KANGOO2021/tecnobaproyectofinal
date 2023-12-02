CREATE database tecnoba;

CREATE TABLE productos (
  productos_id int(4) NOT NULL AUTO_INCREMENT,
  descripcion varchar(100) NOT NULL,
  precio int(8) NOT NULL,
  cantidad int(6) NOT NULL,
  imagen varchar(500) NOT NULL,
  PRIMARY KEY (productos_id)
);

select * from productos;


INSERT INTO productos (descripcion, precio, cantidad, imagen) VALUES 
('Celular Samsung Galaxy A04 128GB Negro', '100000', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F01.galaxy.webp?alt=media&token=5c442f5f-b73a-44fc-81a7-991be235b1b9'),
('Celular Motorola G32 6GB 128GB Plata', '100000', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F02.motorola.webp?alt=media&token=36e04d19-131c-45de-84b4-e3fc4e50a052'),
('Celular TCL 40SE 256GB Twilight Purple', '104999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F03.tlc.webp?alt=media&token=a14d78c6-b7a6-4d1f-85ab-906e6eb7457c'),
('Celular Tecno Spark Go 64GB Rom Blanco', '50000', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F04.spark.webp?alt=media&token=81cefde0-a649-4b0b-b40d-c1926da7fb5e'),
('Notebook Enova 14'' Intel Celeron 4GB 128GB', '189999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F05.notebook_enova.webp?alt=media&token=6273028e-de2f-4045-bc2a-7739aabeaf00'),
('Notebook HP 14'' Intel Core i3 8GB 256GB SSD', '389999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F06.notebook_hp.webp?alt=media&token=6d2b023b-f7d6-448a-a33b-27b2d0aab3a6'),
('Notebook Lenovo 14'' Core i3 4GB 500GB', '249999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F07.notebook_lenovo.webp?alt=media&token=57016def-885a-4271-99df-03f8a670abdd'),
('Notebook Acer 15,6'' Ryzen 5 8GB 1TB Aspire 3', '409999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F08.notebook_acer.webp?alt=media&token=d2044598-3413-4a0c-8338-273c9b3e4c47'),
('Hitachi Smart TV 32'' FULL HD Android', '99999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F09.tv-hitachi32.webp?alt=media&token=b663a6c7-6d61-4be3-9d7f-f4423bfd4f5e'),
('Philips Smart TV 43'' FULL HD Android', '139999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F10.tv-philips43.webp?alt=media&token=049fd100-39d8-4bf5-9810-6094a296ac23'),
('TCL Smart TV 32'' FULL HD Android Negro', '93999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F11.tv-tlc32webp.webp?alt=media&token=2e2ee029-4768-4a26-991b-b8ddc5b98b9f'),
('Samsung Smart TV 55'' 4K UHD Android', '299999', '10', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/imagenes%2F12.tv-samsung55.webp?alt=media&token=833f8adf-fa99-4b2e-bf89-f78cb4732579');



CREATE TABLE usuarios (
  usuarios_id int(4) NOT NULL AUTO_INCREMENT,
  user varchar(100) NOT NULL,
  pass varchar(8) NOT NULL,
  fotoPerfil varchar(500) NOT NULL,
  PRIMARY KEY (usuarios_id)
);

select * from usuarios;


INSERT INTO usuarios (user, pass, fotoPerfil) VALUES 
('admin', 'admin', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/usuarios%2Ffavicon.png?alt=media&token=9f8831be-e04e-4481-8684-678d4dd81435'),
('ser2020munoz@gmail.com', '1234', 'https://firebasestorage.googleapis.com/v0/b/tecnoba-eb442.appspot.com/o/usuarios%2Ffoto_perfil1.png?alt=media&token=14a39128-663b-417b-b844-b6d8010a118c');



