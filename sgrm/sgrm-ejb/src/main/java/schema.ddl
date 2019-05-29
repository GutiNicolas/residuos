
    create table Administrador (
        mail varchar(255) not null,
        primary key (mail)
    );

    create table Camion (
        idCamion int8 not null,
        tEstado int4,
        tResiduos int4,
        ruta_idRuta int8,
        zona_idZona varchar(255),
        primary key (idCamion)
    );

    create table Contenedor (
        idContenedor int8 not null,
        cEstado int4,
        tResiduos int4,
        zona_idZona varchar(255),
        primary key (idContenedor)
    );

    create table Contenedor_Final (
        Contenedor_idContenedor int8 not null,
        finales_mail varchar(255) not null
    );

    create table Final (
        mail varchar(255) not null,
        primary key (mail)
    );

    create table Final_Contenedor (
        Final_mail varchar(255) not null,
        contenedores_idContenedor int8 not null
    );

    create table Gestor (
        nombre varchar(255) not null,
        apellido varchar(255),
        administrador_mail varchar(255),
        primary key (nombre)
    );

    create table Ruta (
        idRuta int8 not null,
        camion_idCamion int8,
        primary key (idRuta)
    );

    create table Usuario (
        mail varchar(255) not null,
        apellido varchar(255),
        nombre varchar(255),
        password varchar(255),
        primary key (mail)
    );

    create table Zona (
        idZona varchar(255) not null,
        zEstado int4,
        gestor_nombre varchar(255),
        primary key (idZona)
    );

    alter table Administrador 
        add constraint FK_ivqbd9shiidccn372gur27xo7 
        foreign key (mail) 
        references Usuario;

    alter table Camion 
        add constraint FK_4wbvsf35yvmlnn8kulj5o745n 
        foreign key (ruta_idRuta) 
        references Ruta;

    alter table Camion 
        add constraint FK_d6n2ywshhvr5kdllyequrscs3 
        foreign key (zona_idZona) 
        references Zona;

    alter table Contenedor 
        add constraint FK_n4ss21sku3x3wrefiju9euprk 
        foreign key (zona_idZona) 
        references Zona;

    alter table Contenedor_Final 
        add constraint FK_b1axoj9cj4kh2hb1o40kya8mi 
        foreign key (finales_mail) 
        references Final;

    alter table Contenedor_Final 
        add constraint FK_r8b0o7rbd9ut2kb8u33lykg6k 
        foreign key (Contenedor_idContenedor) 
        references Contenedor;

    alter table Final 
        add constraint FK_kfk0nstat9w4ms29fne7yh3gy 
        foreign key (mail) 
        references Usuario;

    alter table Final_Contenedor 
        add constraint FK_ale6k4fqla3pkvnve1rjkb9i3 
        foreign key (contenedores_idContenedor) 
        references Contenedor;

    alter table Final_Contenedor 
        add constraint FK_9ksl3632tj9rrb7axanuu3y6v 
        foreign key (Final_mail) 
        references Final;

    alter table Gestor 
        add constraint FK_muayrjgafwyd0afs8n2a78yhw 
        foreign key (administrador_mail) 
        references Administrador;

    alter table Ruta 
        add constraint FK_7sea4jo0t9rn1e0oxl8mrft4c 
        foreign key (camion_idCamion) 
        references Camion;

    alter table Zona 
        add constraint FK_fyt0rcgw1h34b74snfffhnyam 
        foreign key (gestor_nombre) 
        references Gestor;
