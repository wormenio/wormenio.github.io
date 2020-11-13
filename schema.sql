
    create table Calles (
        id bigint not null auto_increment,
        nombre varchar(255),
        altura_desde integer,
        altura_hasta integer,
        paridad_par bit,
        codigo_postal_id bigint,
        primary key (id)
    )

    create table Categorias_juridicas (
        tipo_categoria varchar(31) not null,
        id bigint not null auto_increment,
        nombre varchar(255),
        primary key (id)
    )

    create table Ciudades (
        id bigint not null auto_increment,
        nombre varchar(255),
        provincia_id bigint,
        primary key (id)
    )

    create table Direcciones_postales (
        id bigint not null auto_increment,
        nombre varchar(255),
        id_ciudad bigint,
        Ciudad_id bigint,
        primary key (id)
    )

    create table Documentos_comerciales (
        tipo_documento varchar(20) not null,
        id bigint not null auto_increment,
        nombre varchar(255),
        primary key (id)
    )

    create table Documentos_comerciales_de_egresos (
        egreso_id integer not null,
        fecha_documento tinyblob,
        numero integer,
        documento_comercial_id bigint,
        primary key (documento_comercial_id, egreso_id)
    )

    create table Egresos (
        tipo_egreso varchar(15) not null,
        id bigint not null auto_increment,
        fecha_compra tinyblob,
        monto_total double precision,
        cantidad_presupuesto integer,
        compra_validada bit,
        criterio integer,
        fecha_validacion tinyblob,
        requiere_presupuesto bit,
        entidad_id bigint,
        etiqueta_id bigint,
        moneda_id bigint,
        presupuesto_asignado_id bigint,
        proveedor_id bigint,
        primary key (id)
    )

    create table Entidades (
        tipo_entidad varchar(31) not null,
        id bigint not null auto_increment,
        monto_maximo_egreso double precision,
        nombre_ficticio varchar(255),
        cantidad_empleados integer,
        clasificacion_afip integer,
        codigo_igj integer,
        cuit varchar(255),
        razon_social varchar(255),
        descripcion varchar(255),
        categoria_entidad_id bigint,
        categoria_juridica_id bigint,
        direccion_postal_id bigint,
        entidad_juridica_id bigint,
        primary key (id)
    )

    create table Etiquetas_Egresos (
        id bigint not null auto_increment,
        nombre varchar(255),
        primary key (id)
    )

    create table Items (
        id bigint not null auto_increment,
        nombre varchar(255),
        primary key (id)
    )

    create table Items_de_compra (
        compra_id bigint not null,
        cantidad integer,
        precio_unitario double precision,
        item_id bigint,
        primary key (compra_id, item_id)
    )

    create table Medios_de_pago_del_egreso (
        egreso_id bigint not null,
        medio_de_pago_id bigint not null,
        monto double precision,
        primary key (egreso_id, medio_de_pago_id)
    )

    create table Monedas (
        id bigint not null auto_increment,
        nombre varchar(255),
        decimal_places integer,
        symbol varchar(255),
        primary key (id)
    )

    create table Paises (
        id bigint not null auto_increment,
        nombre varchar(255),
        locale varchar(255),
        moneda_id bigint,
        region_id bigint,
        primary key (id)
    )

    create table Presupuestos (
        id bigint not null auto_increment,
        fecha tinyblob,
        documento_comercial_id bigint,
        moneda_id bigint,
        proveedor_id bigint,
        compra_id bigint,
        primary key (id)
    )

    create table Proveedores (
        id bigint not null auto_increment,
        nombre varchar(255),
        altura integer not null,
        apellido varchar(255),
        cuit varchar(255),
        departamento varchar(255),
        dni varchar(255),
        piso varchar(255),
        razon_social varchar(255),
        calle_id bigint,
        primary key (id)
    )

    create table Provincias (
        id bigint not null auto_increment,
        nombre varchar(255),
        pais_id bigint,
        primary key (id)
    )

    create table Regiones (
        id bigint not null auto_increment,
        nombre varchar(255),
        primary key (id)
    )

    create table Usuario_buzonMensajeCompras (
        Usuario_id bigint not null,
        buzonMensajeCompras varchar(255)
    )

    create table Usuarios (
        id bigint not null auto_increment,
        is_admin bit,
        nombre_usuario varchar(255),
        rol_usuario integer,
        primary key (id)
    )

    create table categorias_entidades (
        id bigint not null auto_increment,
        nombre varchar(255),
        primary key (id)
    )

    create table items_del_presupuesto (
        item_id bigint not null,
        presupuesto_id bigint not null,
        cantidad integer,
        monto double precision,
        primary key (item_id, presupuesto_id)
    )

    create table medios_de_pago (
        tipo_medio varchar(15) not null,
        id bigint not null auto_increment,
        numero_referencia integer,
        primary key (id)
    )

    create table usuario_revisor_compras (
        Egresos_id bigint not null,
        revisores_id bigint not null
    )

    alter table Calles 
        add constraint FK_nswblge8f7nr4a6vaj7fmfl3f 
        foreign key (codigo_postal_id) 
        references Direcciones_postales (id)

    alter table Ciudades 
        add constraint FK_jqq4ce9cm763kej9skp9kefxy 
        foreign key (provincia_id) 
        references Provincias (id)

    alter table Direcciones_postales 
        add constraint FK_t7y65ac2nqer6kmrmf8t8ag8r 
        foreign key (id_ciudad) 
        references Ciudades (id)

    alter table Direcciones_postales 
        add constraint FK_4wrwu7gac6bajd1yldee24kbo 
        foreign key (Ciudad_id) 
        references Ciudades (id)

    alter table Documentos_comerciales_de_egresos 
        add constraint FK_82806q5y9bmnko7ov197ewq0e 
        foreign key (documento_comercial_id) 
        references Documentos_comerciales (id)

    alter table Documentos_comerciales_de_egresos 
        add constraint FK_ql4wfras0u69qd45l9h4lst0w 
        foreign key (egreso_id) 
        references Egresos (id)

    alter table Egresos 
        add constraint FK_dwv1iqttt605pevnhfu9whlub 
        foreign key (entidad_id) 
        references Entidades (id)

    alter table Egresos 
        add constraint FK_qwufity0m9hb3v73uhyfvmxxy 
        foreign key (etiqueta_id) 
        references Etiquetas_Egresos (id)

    alter table Egresos 
        add constraint FK_sr9emvrpa4axii6yaaj5hkulh 
        foreign key (moneda_id) 
        references Monedas (id)

    alter table Egresos 
        add constraint FK_2bl2dj69xuxi3uwv9dgo26r97 
        foreign key (presupuesto_asignado_id) 
        references Presupuestos (id)

    alter table Egresos 
        add constraint FK_ofo4edaohjfc0bdxq600rtkm 
        foreign key (proveedor_id) 
        references Proveedores (id)

    alter table Entidades 
        add constraint FK_brv85w7ahubggj4dvpsudjb1f 
        foreign key (categoria_entidad_id) 
        references categorias_entidades (id)

    alter table Entidades 
        add constraint FK_1b0up9y1kdxld55de81smtrhg 
        foreign key (categoria_juridica_id) 
        references Categorias_juridicas (id)

    alter table Entidades 
        add constraint FK_oy61rs1ap67s75uxafxs6j5yf 
        foreign key (direccion_postal_id) 
        references Direcciones_postales (id)

    alter table Entidades 
        add constraint FK_brsc9k1wwj7ke7w3s3hgigrpw 
        foreign key (entidad_juridica_id) 
        references Entidades (id)

    alter table Items_de_compra 
        add constraint FK_8vj3dq64liax1ncqm0y9f408k 
        foreign key (item_id) 
        references Items (id)

    alter table Items_de_compra 
        add constraint FK_cr6itc7jma2nu1hp4ahxalgbb 
        foreign key (compra_id) 
        references Egresos (id)

    alter table Medios_de_pago_del_egreso 
        add constraint FK_98k7td5ks0q5see5x75krirj 
        foreign key (medio_de_pago_id) 
        references medios_de_pago (id)

    alter table Medios_de_pago_del_egreso 
        add constraint FK_ayo2pdh82seq6ot0spnw1wj6a 
        foreign key (egreso_id) 
        references Egresos (id)

    alter table Paises 
        add constraint FK_ooca51cq15m6ul5tyb18riaor 
        foreign key (moneda_id) 
        references Monedas (id)

    alter table Paises 
        add constraint FK_485f5at7pa40c2ug15kwj0n17 
        foreign key (region_id) 
        references Regiones (id)

    alter table Presupuestos 
        add constraint FK_mdiy86apoxy8tnormu9e477ck 
        foreign key (documento_comercial_id) 
        references Documentos_comerciales (id)

    alter table Presupuestos 
        add constraint FK_5sx7tj6ms4lul7sb2dbglf7g0 
        foreign key (moneda_id) 
        references Monedas (id)

    alter table Presupuestos 
        add constraint FK_tia29gihl1h86vpbaq5hc1996 
        foreign key (proveedor_id) 
        references Proveedores (id)

    alter table Presupuestos 
        add constraint FK_hju37tsvb77rqpat4kk3uxwrs 
        foreign key (compra_id) 
        references Egresos (id)

    alter table Proveedores 
        add constraint FK_i0f6vxcnjwkxu5kemrqfyv51t 
        foreign key (calle_id) 
        references Calles (id)

    alter table Provincias 
        add constraint FK_59a7otbmp8yj5k1c4f64nr89m 
        foreign key (pais_id) 
        references Paises (id)

    alter table Usuario_buzonMensajeCompras 
        add constraint FK_l09ld5b03h5sxhw3vho8dq068 
        foreign key (Usuario_id) 
        references Usuarios (id)

    alter table items_del_presupuesto 
        add constraint FK_lsv1yw0q3euw03jn49w9byyr7 
        foreign key (item_id) 
        references Items (id)

    alter table items_del_presupuesto 
        add constraint FK_fvw1d0d2btw0642k79r718p4p 
        foreign key (presupuesto_id) 
        references Presupuestos (id)

    alter table usuario_revisor_compras 
        add constraint FK_eaacre6a6j2hag555yygol2tf 
        foreign key (revisores_id) 
        references Usuarios (id)

    alter table usuario_revisor_compras 
        add constraint FK_dcubx13rbdg4thvotpv3ngvri 
        foreign key (Egresos_id) 
        references Egresos (id)
