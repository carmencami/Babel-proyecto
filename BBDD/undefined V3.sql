CREATE TABLE Libro
(
  ID_Libro INT NOT NULL,
  ISBN INT(13) NOT NULL,
  Nombre CHAR(35) NOT NULL,
  Imagen CHAR,
  Resumen CHAR(140),
  PRIMARY KEY (ID_Libro),
  UNIQUE (ISBN)
);

CREATE TABLE Categoria
(
  ID_Categoria INT NOT NULL,
  Nombre VARCHAR(15) NOT NULL,
  PRIMARY KEY (ID_Categoria)
);

CREATE TABLE Tiene
(
  ID_Categoria INT NOT NULL,
  ID_Libro INT NOT NULL,
  PRIMARY KEY (ID_Categoria, ID_Libro),
  FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
  FOREIGN KEY (ID_Libro) REFERENCES Libro(ID_Libro)
);

CREATE TABLE Rol
(
  ID_Rol INT NOT NULL,
  Nombre VARCHAR(20) NOT NULL,
  PRIMARY KEY (ID_Rol)
);

CREATE TABLE Galeria_Libro
(
  ID_Galeria_Libro INT NOT NULL,
  ID_Libro INT NOT NULL,
  PRIMARY KEY (ID_Galeria_Libro),
  FOREIGN KEY (ID_Libro) REFERENCES Libro(ID_Libro)
);

CREATE TABLE Usuario
(
  ID_Usuario INT NOT NULL,
  Nombre VARCHAR NOT NULL,
  Pass VARCHAR(32) NOT NULL,
  Imagen VARCHAR,
  Correo VARCHAR(40) NOT NULL,
  Activo INT(1) NOT NULL,
  ID_Rol INT NOT NULL,
  PRIMARY KEY (ID_Usuario),
  FOREIGN KEY (ID_Rol) REFERENCES Rol(ID_Rol),
  DEFAULT 1 FOR Activo
);

CREATE TABLE Ejemplar
(
  Precio INT NOT NULL,
  Visible INT(1) NOT NULL,
  ID_Ejemplar INT NOT NULL,
  Estado VARCHAR(100) NOT NULL,
  ID_Usuario INT NOT NULL,
  ID_Libro INT NOT NULL,
  PRIMARY KEY (ID_Ejemplar),
  FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
  FOREIGN KEY (ID_Libro) REFERENCES Libro(ID_Libro)
);

CREATE TABLE Conversacion
(
  IDConversacion INT NOT NULL,
  ID_Usuario1 INT NOT NULL,
  ID_Usuario2 INT NOT NULL,
  PRIMARY KEY (IDConversacion),
  FOREIGN KEY (ID_Usuario1) REFERENCES Usuario(ID_Usuario),
  FOREIGN KEY (ID_Usuario2) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Factura
(
  ID_Factura INT NOT NULL,
  ID_Ejemplar INT NOT NULL,
  ID_Usuario INT NOT NULL,
  PRIMARY KEY (ID_Factura),
  FOREIGN KEY (ID_Ejemplar) REFERENCES Ejemplar(ID_Ejemplar),
  FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE IMG
(
  ID_IMG INT NOT NULL,
  Ruta VARCHAR NOT NULL,
  ID_Galeria INT NOT NULL,
  PRIMARY KEY (ID_IMG),
  FOREIGN KEY (ID_Galeria) REFERENCES Galeria_Libro(ID_Galeria_Libro),
  UNIQUE (Ruta)
);

CREATE TABLE Comentario
(
  ID_Comentario VARCHAR NOT NULL,
  Puntuacion INT,
  Texto VARCHAR,
  ID_Libro INT NOT NULL,
  ID_Usuario INT NOT NULL,
  PRIMARY KEY (ID_Comentario),
  FOREIGN KEY (ID_Libro) REFERENCES Libro(ID_Libro),
  FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);

CREATE TABLE Galeria_Ejemplar
(
  ID_Galeria_Ejemplar INT NOT NULL,
  ID_Ejemplar INT NOT NULL,
  ID_IMG INT NOT NULL,
  PRIMARY KEY (ID_Galeria_Ejemplar),
  FOREIGN KEY (ID_Ejemplar) REFERENCES Ejemplar(ID_Ejemplar),
  FOREIGN KEY (ID_IMG) REFERENCES IMG(ID_IMG)
);

CREATE TABLE Galeria_Comentario
(
  ID_Galeria_Comentario INT NOT NULL,
  ID_Comentario VARCHAR NOT NULL,
  FOREIGN KEY (ID_Comentario) REFERENCES Comentario(ID_Comentario)
);

CREATE TABLE Mensaje
(
  ID_Mensaje INT NOT NULL,
  Texto VARCHAR NOT NULL,
  Fecha DATE NOT NULL,
  ID_Conversacion INT NOT NULL,
  PRIMARY KEY (ID_Mensaje),
  FOREIGN KEY (ID_Conversacion) REFERENCES Conversacion(IDConversacion)
);