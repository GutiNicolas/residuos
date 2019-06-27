<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.net.UnknownHostException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Mapa de Estado</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<link rel="icon" type="image/png" href="resources/assets/images/icons/favicon.ico"/>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" type="text/css"
	href="https://code.getmdl.io/1.1.3/material.indigo-orange.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.5.0/proj4.js"></script>
<script src="https://epsg.io/32721.js"></script>
<script
	src="http://svn.osgeo.org/metacrs/proj4js/trunk/lib/proj4js-compressed.js"></script>
<script
	src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
<link rel="stylesheet"
	src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/css/ol.css"></link>
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="stylesheet" href="home.css">
<script src='https://npmcdn.com/@turf/turf/turf.min.js'></script>
</head>
<body>
	<jsp:include page="header.jsp" />

	<%
		InetAddress ipAddr;
	  try {

		ipAddr = InetAddress.getLocalHost();
		String ipHostAddr = String.format(ipAddr.getHostAddress());
		session.setAttribute("ipAddr", ipHostAddr);
		System.out.println("Current IP address : " + ipAddr.getHostAddress());

	  } catch (UnknownHostException e) {

		e.printStackTrace();

	  }
	
	 %>
	
	 
<div id="container">
		<div id="map" class="map"></div>
		<button id="btnEdit2"
			class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
			<i class="material-icons">cached</i>
		</button>
		<button id="btnCho2"
			class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
			<i class="material-icons">info</i>
		</button>
		
		<div id="infoCont2"></div>

		<script type="text/javascript">
			var map;
			var localhost = "<%=session.getAttribute("ipAddr")%>";
			proj4.defs('EPSG:32721',
					'+proj=utm +zone=21 +south +datum=WGS84 +units=m +no_defs');
			ol.proj.proj4.register(proj4);
			var pronos = ol.proj.get('EPSG:32721');

			var formatWFS = new ol.format.WFS();

			var formatGML = new ol.format.GML3({
				featureNS : 'http://www.opengeospatial.net/cite',
				featureType : 'zona',
				srsName : 'EPSG:32721'
			});

			var xs = new XMLSerializer();

			var sourcecWFS = new ol.source.Vector({
				loader : function(extent, resolution, projection) {
					var url = 'http://' + localhost + ':8081/geoserver/wfs?service=WFS'
							+ '&version=2.0.0&request=GetFeature'
							+ '&outputFormat=text/javascript'
							+ '&typename=cite:contenedor'
							+ '&format_options=callback:loadFeaturesc'
							+ '&srsname=EPSG:32721';
					// use jsonp: false to prevent jQuery from adding the "callback"
					$.ajax({
						url : url,
						dataType : 'jsonp',
						jsonp : false
					});
				}
			});

			var sourcezWFS = new ol.source.Vector({
				loader : function(extent, resolution, projection) {
					var url = "http://" + localhost + ":8081/geoserver/wfs?service=WFS"
							+ "&version=2.0.0&request=GetFeature"
							+ '&outputFormat=text/javascript'
							+ "&typename=cite:zona"
							+ "&format_options=callback:loadFeaturesz"
							+ '&srsname=EPSG:32721';
					// use jsonp: false to prevent jQuery from adding the "callback"
					$.ajax({
						url : url,
						dataType : 'jsonp',
						jsonp : false
					});
				}
			});

			/**
			 * JSONP WFS callback function.
			 * @param {Object} response The response object.
			 */
			window.loadFeaturesz = function(response) {
				sourcezWFS.addFeatures(new ol.format.GeoJSON()
						.readFeatures(response));
			};

			window.loadFeaturesc = function(response) {
				sourcecWFS.addFeatures(new ol.format.GeoJSON()
						.readFeatures(response));
			};

			var layercWFS = new ol.layer.Vector({
				visible : true,
				source : sourcecWFS
			});

			var layerzWFS = new ol.layer.Vector({
				visible : true,
				source : sourcezWFS
			});

			var layers = [ new ol.layer.Tile({
				source : new ol.source.OSM(),
				visible : true
			}), layerzWFS, layercWFS ];

			var cordss = ol.proj.transform([ -56.162109, -34.909584 ],
					'EPSG:4326', 'EPSG:32721');

			var interaction;

			var interactionSelectPointerMove = new ol.interaction.Select({
				condition : ol.events.condition.pointerMove
			});

			var interactionSelect = new ol.interaction.Select({
				style : new ol.style.Style({
					stroke : new ol.style.Stroke({
						color : '#FF2828'
					})
				})
			});

			var interactionSnap = new ol.interaction.Snap({
				source : layerzWFS.getSource()
			});

			map = new ol.Map({
				layers : layers,
				controls : [],
				interactions : [ interactionSelectPointerMove,
						new ol.interaction.MouseWheelZoom(),
						new ol.interaction.DragPan() ],
				target : 'map',
				view : new ol.View({
					projection : pronos,
					center : cordss,
					zoom : 14
				})
			});

			/*
			var interaction;


			var interactionSelect = new ol.interaction.Select({
			    style: new ol.style.Style({
			        stroke: new ol.style.Stroke({
			            color: '#FF2828'
			        })
			    })
			});

			var interactionSnap = new ol.interaction.Snap({
			    source: layerWFS.getSource()
			});   */

			/*   map.addInteraction(interactionSelect);
			   var selectedFeat = interactionSelect.getFeatures();

			   var modifyFeat = new ol.interaction.Modify({
			       features: selectedFeat
			   });
			   map.addInteraction(modifyFeat);   */
			function calcularestadozona(t, p) {
				var res = 0;
				res = (100 * p) / t;
				return res;
			}

			function iniciarestados() {
				var contens = sourcecWFS.getFeatures();
				for (var j = 0; j < contens.length; j++) {
					var cn = contens[j];
					var cnv = cn.get('cestado');
					switch (cnv) {
					case 0:
						cn
								.setStyle(new ol.style.Style(
										{
											image : new ol.style.Icon(
													({
														color : '#EBD905',
														crossOrigin : 'anonymous',
														src : 'https://openlayers.org/en/latest/examples/data/dot.png'
													}))
										}));
						break;
					case 1:
						cn
								.setStyle(new ol.style.Style(
										{
											image : new ol.style.Icon(
													({
														color : '#F10404',
														crossOrigin : 'anonymous',
														src : 'https://openlayers.org/en/latest/examples/data/dot.png'
													}))
										}));
						break;
					case 2:
						cn
								.setStyle(new ol.style.Style(
										{
											image : new ol.style.Icon(
													({
														color : '#1BC504',
														crossOrigin : 'anonymous',
														src : 'https://openlayers.org/en/latest/examples/data/dot.png'
													}))
										}));
						break;

					}
				}
				var zonet = sourcezWFS.getFeatures();
				for (var h = 0; h < zonet.length; h++) {
					var zn = zonet[h];
					var znv = zn.getId().split(".");
					var num_cont = 0;
					var num_cont_des = 0;
					for (var i = 0; i < contens.length; i++) {
						var cn = contens[i];
						var cnv = cn.get('zona_id');
						if (cnv == znv[1]) { //El contenedor esta en la zona
							num_cont++;
							if (cn.get('cestado') == 0
									|| cn.get('cestado') == 1) {
								num_cont_des++;
							}
						}
						var porc = calcularestadozona(num_cont, num_cont_des);
						if (porc < 5) { //VERDE
							zn.setStyle(new ol.style.Style({
								fill : new ol.style.Fill({
									color : 'rgba(0, 255, 0 , 0.3)' //#A8EC9E			
								})
							}));
						}
						if (porc > 4 && porc < 21) { //AMARILLO
							zn.setStyle(new ol.style.Style({
								fill : new ol.style.Fill({
									color : 'rgba(255, 255, 0, 0.3)' //#F1EF6F
								})
							}));
						}
						if (porc > 20) { //ROJO
							zn.setStyle(new ol.style.Style({
								fill : new ol.style.Fill({
									color : 'rgba(255, 0, 0, 0.3)' //#F15858
								})
							}));
						}
					}
				}
			}

			var transactWFS = function(p, f) {
				var node;
				switch (p) {
				case 'insert':
					node = formatWFS.writeTransaction([ f ], null, null,
							formatGML);
					break;
				case 'update':
					node = formatWFS.writeTransaction(null, [ f ], null,
							formatGML);
					break;
				case 'delete':
					node = formatWFS.writeTransaction(null, null, [ f ],
							formatGML);
					break;
				}
				s = new XMLSerializer();
				str = s.serializeToString(node);
				$.ajax('http://' + localhost + ':8081/geoserver/wfs', {
					type : 'POST',
					dataType : 'xml',
					processData : false,
					contentType : 'text/xml',
					data : str
				}).done(function() {
					layerWFS.getSource().clear();
					layerWFS.getSource().refresh();
				});
			}

			/*selectFeat.getFeatures().on('change:length', function (e) {
			 transactWFS('delete', e.target.item(0));
			 }); */

			function pertenece(e) {
				//e.setId(1);
				var format = new ol.format.GeoJSON();
				var puntoturf = format.writeFeatureObject(e, {
					'featureProjection' : 'EPSG:4326'
				});
				var zonitas;
				fetch(
						'http://' + localhost + ':8081/geoserver/wfs?request=getFeature&typeName=cite:zona&srs=EPSG:4326&outputFormat=application/json')
						.then(function(response) {
							return response.json();
						})
						.then(
								function(json) {
									var areturn = '';
									zonitas = format.readFeatures(json);
									//   var street = features[0];

									for (var i = 0; i < zonitas.length; i++) {
										var zon = zonitas[i];
										var zonaturf = format
												.writeFeatureObject(zon);
										if (!turf.booleanDisjoint(zonaturf,
												puntoturf)) {
											areturn = zon.getId();

										}
									}
									if (areturn == '') {
										var tipoSelec = document
												.getElementById('tipocont');
										var tipoVal = tipoSelec.value;
										if (tipoVal !== 'None') {
											//e.set('idgestor', tipoVal);
											transactWFS('insert', e);
										} else {
											transactWFS('insert', e);
										}

									} else {
										alert('La zona no puede compartir area geografica con otras zonas');
										layerWFS.getSource().clear();
										layerWFS.getSource().refresh();
									}

								});
			}

			$('button')
					.click(
							function() {
								$(this).siblings().removeClass('btn-active');
								$(this).addClass('btn-active');
								map.removeInteraction(interaction);
								interactionSelect.getFeatures().clear();
								map.removeInteraction(interactionSelect);

								switch ($(this).attr('id')) {

								case 'btnEdit2':
									iniciarestados();
									break;

								case 'btnPoint':
									interaction = new ol.interaction.Draw({
										type : 'Point',
										source : layerWFS.getSource()
									});
									map.addInteraction(interaction);
									interaction
											.on(
													'drawend',
													function(e) {
														var tipoSelec = document
																.getElementById('tipocont');
														var tipoVal = tipoSelec.value;
														if (tipoVal !== 'None') {
															e.feature
																	.set(
																			'nombre_con',
																			tipoVal);
															transactWFS(
																	'insert',
																	e.feature);
														} else {
															alert("Seleccione un tipo para el contenedor");
														}
													});
									break;

								case 'btnLine':
									interaction = new ol.interaction.Draw({
										type : 'LineString',
										source : layerWFS.getSource()
									});
									map.addInteraction(interaction);
									interaction.on('drawend', function(e) {
										transactWFS('insert', e.feature);
									});
									break;

								case 'btnArea':
									iniciarestados();
									break;

								case 'btnDelete':
									interaction = new ol.interaction.Select();
									interaction
											.getFeatures()
											.on(
													'add',
													function(e) {
														//    layerWFS.getSource().removeFeature(e.target.item(0));
														//console.log(e.target.item(0).getId() + 'COSO');
														transactWFS(
																'delete',
																e.target
																		.item(0));
														layerWFS
																.getSource()
																.removeFeature(
																		e.target
																				.item(0));
														interactionSelectPointerMove
																.getFeatures()
																.clear();
														interaction
																.getFeatures()
																.clear();
													});
									map.addInteraction(interaction);
									break;

								case 'btnCho2':
									interaction = new ol.interaction.Select();
									interaction
											.getFeatures()
											.on(
													'add',
													function(e) {
														//todo           
														var info = document
																.getElementById('infoCont');
														var spl = e.target
																.item(0)
																.getId().split(
																		".");
														if (spl[0] == 'zona') {
															info.innerHTML = e.target
																	.item(0)
																	.getId();
														} else {
															var tipore;
															switch (e.target
																	.item(0)
																	.get(
																			'cestado')) {
															case 0:
																tipore = "Lleno";
																break;
															case 1:
																tipore = "Roto";
																break;
															case 2:
																tipore = "Disponible";
																break;
															}

															var tiporee;
															switch (e.target
																	.item(0)
																	.get(
																			'tresiduos')) {
															case 0:
																tiporee = "Plastico";
																break;
															case 1:
																tiporee = "Pilas";
																break;
															case 2:
																tiporee = "Papel";
																break;
															case 3:
																tiporee = "Organico";
																break;
															case 4:
																tiporee = "Vidrio";
																break;

															}
															info.innerHTML = e.target
																	.item(0)
																	.getId()
																	+ ' Estado: '
																	+ tipore
																	+ ' Tipo: '
																	+ tiporee;
														}
													});
									map.addInteraction(interaction);
									break;

								default:
									break;
								}
							});
		</script>



	</div>



		<script src="https://code.jquery.com/jquery-3.4.1.min.js"
		integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>