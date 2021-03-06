INSERT INTO `Regiones` (`id`, `nombre`) VALUES (NULL, 'Region 1');
INSERT INTO `Monedas` (`id`, `nombre`, `decimal_places`, `symbol`) VALUES (NULL, 'Peso argentino', '2', '$');
INSERT INTO `Paises` (`id`, `nombre`, `locale`, `moneda_id`, `region_id`) VALUES (NULL, 'Argentina', 'EsAr', '1', '1');
INSERT INTO `Provincias` (`id`, `nombre`, `pais_id`) VALUES (NULL, 'Ciudad Autónoma de Buenos Aires', '1');
INSERT INTO `Ciudades` (`id`, `nombre`, `provincia_id`) VALUES (NULL, 'Ciudad Autónoma de BsAs', '1');
INSERT INTO `Direcciones_postales` (`id`, `nombre`, `ciudad_id`) VALUES (NULL, '1258', '1');
INSERT INTO `Calles` (`id`, `nombre`, `altura_desde`, `altura_hasta`, `paridad_par`, `direccion_postal_id`) VALUES (NULL, 'Rivadavia', '1', '2500', NULL, '1');
INSERT INTO `Proveedores` (`id`, `nombre`, `altura`, `apellido`, `cuit`, `departamento`, `dni`, `piso`, `razon_social`, `calle_id`) VALUES (NULL, 'Proveedor 1', '255', 'Perez', '20358585852', '3', '35858585', '2', 'Ofimatica', '1');
INSERT INTO `Etiquetas_Egresos` (`id`, `nombre`) VALUES (NULL, 'Amoblamiento'), (NULL, 'Indumentaria');
INSERT INTO `Documentos_comerciales` (`tipo_documento`, `id`, `nombre`) VALUES ('Factura', NULL, 'Factura'), ('Ticket', NULL, 'Ticket');
INSERT INTO `Categorias_juridicas` (`tipo_categoria`, `id`, `nombre`) VALUES ('Empresa', NULL, 'Empresa'), ('Osc', NULL, 'Osc');
INSERT INTO `Categorias_entidades` (`id`, `nombre`) VALUES (NULL, 'Ong'), (NULL, 'Judicial'), (NULL, 'Industria Agropecuaria');
