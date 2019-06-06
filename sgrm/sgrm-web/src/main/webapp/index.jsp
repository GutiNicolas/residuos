<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Busqueda de Contenedores</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
<meta name="apple-mobile-web-app-capable" content="yes">
<link rel="icon" type="image/png" href="resources/assets/images/icons/favicon.ico"/>
<link rel="stylesheet" href="/geoserver/style.css" type="text/css" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet" href="https://code.getmdl.io/1.3.0/material.pink-light_blue.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.5.0/proj4.js"></script>
<script src="https://epsg.io/32721.js"></script>
<script
	src="http://svn.osgeo.org/metacrs/proj4js/trunk/lib/proj4js-compressed.js"></script>
<script
	src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/build/ol.js"></script>
<link rel="stylesheet"
	src="https://cdn.rawgit.com/openlayers/openlayers.github.io/master/en/v5.3.0/css/ol.css"></link>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<meta content="width=device-width, initial-scale=1" name="viewport" />
<link rel="stylesheet" href="home.css">
<script src="qrcode.js"></script>
<script src='https://npmcdn.com/@turf/turf/turf.min.js'></script>

<style> 
input[type=button], input[type=submit], input[type=reset] {
  background-color: #51cf92;
  border: none;
  color: white;
}
</style>

</head>
<body>
	<jsp:include page="header.jsp" />
	<div id="container">
		<div class="row pt-10">
			<div class="col-12 col-md-4">
				<div class="text-center">
					<div class="margen-arriba">
						<div class="text-center">
							<h2 class="pl-5" align="left" style="color: #00bfdf"><strong>Criterios de búsqueda</strong></h2>
						</div>
						<form class="formulario-bk m-lg-2 m-sm-5">
							<div class="form-row align-items-center px-3">
								<label for="exampleFormControlSelect1"><strong>Tipo de Almacenamiento</strong></label>
								<div class="col-12 col-md-8 mb-3">
									<select class="form-control" id="tipocont">
										<option value="None">Ninguno</option>
										<option value="1">Pilas</option>
										<option value="2">Papel</option>
										<option value="0">Plásticos</option>
										<option value="3">Orgánico</option>
										<option value="4">Vidrio</option>
									</select>
								</div>
								<div class="col-12 col-md-4 mb-3">
									<input id="clickMe" type="button" class="btn btn-dark"
										value="Buscar" onclick="buscarTipo();" />
								</div>
							</div>
							
							<div class="form-row px-3">
								<label for="exampleFormControlSelect1"><strong>Estado del contenedor</strong></label>
								<div class="col-12 col-md-8 mb-3">
									<select class="form-control" id="estadocont">
										<option value="None">Ninguno</option>
										<option value="0">Lleno</option>
										<option value="1">Roto</option>
										<option value="2">Disponible</option>
									</select>
								</div>
								<div class="col-12 col-md-4 mb-3">
									<input id="clickMe2" type="button" class="btn btn-dark"
										value="Buscar" onclick="buscarEstado();" />
								</div>
							</div>

							<div class="form-row px-3">
							<label for="exampleFormControlSelect1"><strong>Interseccion de calles</strong></label>
								<div class="col-12 col-md-8 mb-3">
									<input type="text" class="form-control" id="calleuno" aria-describedby="emailHelp" placeholder="Calle 1">
 							 		<input type="text" class="form-control mt-2" id="calledos" aria-describedby="emailHelp" placeholder="Calle 2">  
								</div>
								<div class="col-12 col-md-4 mb-3">
									 <input id="clickMe3" type="button" value="Buscar" class="btn btn-dark" onclick="buscarCalle();" />
								</div>
							</div>
							
							<div class="form-row px-3">
							<label for="exampleFormControlSelect1"> 
								<i class="fas fa-crosshairs fa-lg ml-2 pr-2"></i> 
								<strong>Localización actual</strong>
							</label>
								<div class="col-12 col-md-4 mb-3">
									 <input id="clickMe3" type="button" value="Buscar" class="btn btn-dark" onclick="buscarGPS();" />
								</div>
							</div>
							
							<div class="form-row align-items-center px-3">
								<br><label for="exampleFormControlSelect1"> <i class="fas fa-info-circle"></i> Haga doble-click sobre el mapa para
									buscar por Geolocalizacion</label>
							</div>
						</form>
						<!-- 						</div> -->
					</div>
				</div>
			</div>
			<div class="col-12 col-md-8 pt-md-10 my-md-20 colornegro" style="height: 100%;">
				<div id="map" class="map" style="width: 100%; height: 100%; min-height: 270px; position:fixed"></div>
				<button id="btnCho"
					class="mdl-button mdl-js-button mdl-button--fab mdl-button--colored">
					<i class="material-icons">info</i>
				</button>
				<div id="infoCont"></div>

				<script type="text/javascript">
		   
	var map;
	proj4.defs('EPSG:32721','+proj=utm +zone=21 +south +datum=WGS84 +units=m +no_defs');
	ol.proj.proj4.register(proj4);
	var pronos =  ol.proj.get('EPSG:32721');

	
		
	    var formatWFS = new ol.format.WFS();

	    var formatGML = new ol.format.GML3({
	        featureNS: 'http://www.opengeospatial.net/cite',
	        featureType: 'contenedor',
	        srsName: 'EPSG:32721'
	    });

	    var xs = new XMLSerializer();

		var sourceWFS = new ol.source.Vector({
		    loader: function (extent, resolution, projection) {
		        var url = "http://localhost:8081/geoserver/wfs?service=WFS"
		                + "&version=2.0.0&request=GetFeature"
		                + '&outputFormat=text/javascript'
		                + "&typename=cite:contenedor"
		                + "&format_options=callback:loadFeatures"
		                + '&srsname=EPSG:32721';
		        // use jsonp: false to prevent jQuery from adding the "callback"
		        $.ajax({url: url, dataType: 'jsonp', jsonp: false});
		    }
		});

		/**
		 * JSONP WFS callback function.
		 * @param {Object} response The response object.
		 */
		window.loadFeatures = function (response) {
			 sourceWFS.addFeatures(new ol.format.GeoJSON().readFeatures(response));
		};	
	
	    var layerWFS = new ol.layer.Vector({
            visible: true,
        	source: sourceWFS
    	});

	    var sourceCWFS = new ol.source.Vector({
		    loader: function (extent, resolution, projection) {
		        var url = "http://localhost:8081/geoserver/wfs?service=WFS"
		                + "&version=2.0.0&request=GetFeature"
		                + '&outputFormat=text/javascript'
		                + "&typename=cite:v_mdg_vias"
		                + "&format_options=callback:loadFeaturesC"
		                + '&srsname=EPSG:32721';
		        // use jsonp: false to prevent jQuery from adding the "callback"
		        $.ajax({url: url, dataType: 'jsonp', jsonp: false});
		    }
		});

		/**
		 * JSONP WFS callback function.
		 * @param {Object} response The response object.
		 */
		window.loadFeaturesC = function (response) {
			 sourceCWFS.addFeatures(new ol.format.GeoJSON().readFeatures(response));
		};	
	
	    var layerCWFS = new ol.layer.Vector({
            visible: true,
        	source: sourceCWFS,
        	opacity: 0.0
    	});

    var layers = [
        new ol.layer.Tile({
            source: new ol.source.OSM(),
            visible: true
        }),
        new ol.layer.Image({
            visible: false, //NO ESTA VISIBLE
            source: new ol.source.ImageWMS({
                url: 'http://localhost:8080/geoserver/wms?',
                params: {'LAYERS': 'cite:sig_comunales'},
                serverType: 'geoserver',
                crossOrigin: 'anonymous'
            }),
            opacity: 0.5
        }),
        new ol.layer.Image({
            visible: false,
            source: new ol.source.ImageWMS({
                url: 'http://localhost:8080/geoserver/wms?',
                params: {'LAYERS': 'cite:v_ep_residuos_decaux'},
                serverType: 'geoserver',
                crossOrigin: 'anonymous'
            })
        }),
        new ol.layer.Vector({
            visible: false,
        	source: new ol.source.Vector({
            	url: 'http://localhost:8080/geoserver/wfs?request=getFeature&typeName=cite:v_ep_residuos_decaux&srs=EPSG:32721&outputFormat=application/json',
            	format: new ol.format.GeoJSON()
        	})
    	}),
    	new ol.layer.Vector({
             visible: true,
         	source: new ol.source.Vector({
             	url: 'http://localhost:8081/geoserver/wfs?request=getFeature&typeName=cite:zona&srs=EPSG:32721&outputFormat=application/json',
             	format: new ol.format.GeoJSON()
         	})
     	}),
     	layerCWFS,
    	layerWFS    
    ];

    var cordss = ol.proj.transform([-56.162109, -34.909584], 'EPSG:4326', 'EPSG:32721');

    var interaction;

   /* var interactionSelectPointerMove = new ol.interaction.Select({
        condition: ol.events.condition.pointerMove
    });  */

    var interactionSelect = new ol.interaction.Select({
        style: new ol.style.Style({
            stroke: new ol.style.Stroke({
                color: '#FF2828'
            })
        })
    });

    var interactionSnap = new ol.interaction.Snap({
        source: layerWFS.getSource()
    });

    map = new ol.Map({
        layers: layers,
        controls: [],
        interactions: [
 //       	interactionSelectPointerMove,   //SI SE DESCOMENTA DESCOMENTAR LA DECLARACION QUE ESTA MAS ARRIBA, CONSUME MUCHO
            new ol.interaction.MouseWheelZoom(),
            new ol.interaction.DragPan()
        ],
        target: 'map',
        view: new ol.View({
            projection: pronos,
            center: cordss,
            zoom: 14
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
    var selectTipo = new ol.interaction.Select();
    map.addInteraction(selectTipo);

    function buscarTipo() {
    	var tipoSelec = document.getElementById('tipocont');
        var tipoVal = tipoSelec.value;
        if (tipoVal !=='None') {
			selectTipo.getFeatures().clear();
			var feats = selectTipo.getFeatures();

			var contens = sourceWFS.getFeatures();
	        for(var j = 0; j < contens.length; j++){
	            var cn = contens[j];
	            var cnv = cn.get('tresiduos');
	            if(cnv == tipoVal) {
					feats.push(cn);
		        }
        	}
	        
        }
    }

    function buscarEstado() {
    	var estadoSelec = document.getElementById('estadocont');
        var estadoVal = estadoSelec.value;
        var tipoSelec = document.getElementById('tipocont');
        var tipoVal = tipoSelec.value;
        if (estadoVal !=='None' && tipoVal !=='None') {
        	selectTipo.getFeatures().clear();
			var feats = selectTipo.getFeatures();

			var contens = sourceWFS.getFeatures();
	        for(var j = 0; j < contens.length; j++){
	            var cn = contens[j];
	            var cnv = cn.get('tresiduos');
	            var cne = cn.get('cestado');
	            if(cnv == tipoVal && cne == estadoVal) {
					feats.push(cn);
		        }
        	}      	

        }
        if (estadoVal !=='None' && tipoVal =='None') {
			selectTipo.getFeatures().clear();
			var feats = selectTipo.getFeatures();

			var contens = sourceWFS.getFeatures();
	        for(var j = 0; j < contens.length; j++){
	            var cn = contens[j];
	            var cnv = cn.get('cestado');
	            if(cnv == estadoVal) {
					feats.push(cn);
		        }
        	}
	        
        }
    }

    function buscarGPS() {

    	navigator.geolocation.getCurrentPosition(showPosition);    	
    	
    }

    function showPosition(position) {
    	  var latlon = position.coords.latitude + "," + position.coords.longitude;
			alert(latlon);
			var nuevap = proj4("+proj=utm +zone=21 +south +datum=WGS84 +units=m +no_defs", [position.coords.longitude,position.coords.latitude]);
			alert(nuevap);
    	  	selectTipo.getFeatures().clear();
  			var feats = selectTipo.getFeatures();
         	var closestFeature = sourceWFS.getClosestFeatureToCoordinate(nuevap);
         	feats.push(closestFeature);	
    	}

    function buscarCalle() {
    	var calleuno = document.getElementById('calleuno');
        var calleunoVal = calleuno.value.toUpperCase();
        var calledos = document.getElementById('calledos');
        var calledosVal = calledos.value.toUpperCase();

        var callea=[];
        var calleb=[];

        var calles = sourceCWFS.getFeatures();
        for(var j = 0; j < calles.length; j++){
            var cn = calles[j];
            var cnv = cn.get('nom_calle');        
            if(cnv == calleunoVal) {
				callea.push(cn);			
	        }
    	}   	

        for(var i = 0; i < calles.length; i++){
            var cn = calles[i];
            var cnv = cn.get('nom_calle');
            if(cnv == calledosVal) {
            	calleb.push(cn);			
	        }
    	}

        var format = new ol.format.GeoJSON();
        
		for(var a = 0; a < callea.length; a++) {
			var lineaturf = format.writeFeatureObject(callea[a], {'featureProjection': 'EPSG:4326'});
			for(var b = 0; b < calleb.length; b++) {
				var lineaturfdos = format.writeFeatureObject(calleb[b], {'featureProjection': 'EPSG:4326'});
				var ints = turf.lineIntersect(lineaturf,lineaturfdos);
				if(ints.features.length/* ints != null */){
					selectTipo.getFeatures().clear();
					var feats = selectTipo.getFeatures();
			       	var closestFeature = sourceWFS.getClosestFeatureToCoordinate(ints.features[0].geometry.coordinates);
			       	feats.push(closestFeature);				
				}
			}
		}

    }

   var displaySnap = function(coordinate) {
	   	selectTipo.getFeatures().clear();
		var feats = selectTipo.getFeatures();
       	var closestFeature = sourceWFS.getClosestFeatureToCoordinate(coordinate);
       	feats.push(closestFeature);
     };

   map.on('dblclick', function(evt) {
       displaySnap(evt.coordinate);
     });

	var transactWFS = function(p, f){
    var node;
    switch (p) {
        case 'insert':
            node = formatWFS.writeTransaction([f], null, null, formatGML);
            break;
        case 'update':
            node = formatWFS.writeTransaction(null, [f], null, formatGML);
            break;
        case 'delete':
            node = formatWFS.writeTransaction(null, null, [f], formatGML);
            break;
    }
    s = new XMLSerializer();
    str = s.serializeToString(node);
    $.ajax('http://localhost:8081/geoserver/wfs', {
        type: 'POST',
        dataType: 'xml',
        processData: false,
        contentType: 'text/xml',
        data: str
    }).done( function(){
    	layerWFS.getSource().clear();
        layerWFS.getSource().refresh();
        });

}
/*selectFeat.getFeatures().on('change:length', function (e) {
    transactWFS('delete', e.target.item(0));
}); */




function pertenece (e, tipoVal) {
	//e.setId(1);
	var format = new ol.format.GeoJSON();
	var puntoturf = format.writeFeatureObject(e, {'featureProjection': 'EPSG:4326'});
	var zonitas;
	fetch('http://localhost:8081/geoserver/wfs?request=getFeature&typeName=cite:zona&srs=EPSG:4326&outputFormat=application/json').then(function(response) {
	        return response.json();
	      }).then(function(json) {
	        var areturn= '';
	        zonitas = format.readFeatures(json);
	     //   var street = features[0];
	      
	for (var i = 0; i < zonitas.length; i++){
			var zon = zonitas[i];
			var zonaturf = format.writeFeatureObject(zon);
			if (turf.booleanContains(zonaturf, puntoturf)) {
				areturn = zon.getId();
				splited = zon.getId().split(".");
				e.set('tresiduos', tipoVal);
				e.set('cestado', 2);
            	e.set('zona_idzona', splited[1]);
                transactWFS('insert', e);
				return;
			}
	}
	if (areturn == '') {alert('El contenedor debe estar en una zona');}
	layerWFS.getSource().clear();
    layerWFS.getSource().refresh();
	});
}

function generarQR() {
	var ccc = document.getElementById('codigoqr');
    ccc.innerHTML = '';
    var contens = sourceWFS.getFeatures();
    var max = 0;
    for(var j = 0; j < contens.length; j++){
        var cn = contens[j];
        var cnv = cn.getId().split(".");
		if(max < cnv[1] ){
			max = cnv[1];
		}
    }
    max++;
   // USAR max+1
    let qrcode = new QRCode("codigoqr", {
		text: "http://localhost:8080/sgrm-web/reportarContenedor?id="+max,
		width: 177,
		height: 177,
		colorDark: "#37323E",
		colorLight: "#FBFFF1",
		correctLevel: QRCode.CorrectLevel.H
        });
}


$('button').click(function () {
    $(this).siblings().removeClass('btn-active');
    $(this).addClass('btn-active');
    map.removeInteraction(interaction);
    interactionSelect.getFeatures().clear();
    map.removeInteraction(interactionSelect);

    switch ($(this).attr('id')) {

        case 'btnEdit':
            map.addInteraction(interactionSelect);
            interaction = new ol.interaction.Modify({
                features: interactionSelect.getFeatures()
            });
            map.addInteraction(interaction);
            map.addInteraction(interactionSnap);
            dirty = {};
            interactionSelect.getFeatures().on('add', function (e) {
                e.element.on('change', function (e) {
                    dirty[e.target.getId()] = true;
                });
            });
            interactionSelect.getFeatures().on('remove', function (e) {
                var f = e.element;
                if (dirty[f.getId()]) {
                    delete dirty[f.getId()];
                    var featureProperties = f.getProperties();
                    delete featureProperties.boundedBy;
                    var clone = new ol.Feature(featureProperties);
                    clone.setId(f.getId());
                    transactWFS('update', clone);
                }
            });
            break;

        case 'btnPoint':
            interaction = new ol.interaction.Draw({
                type: 'Point',
                source: layerWFS.getSource()
            });
            map.addInteraction(interaction);
            interaction.on('drawend', function (e) {
                var tipoSelec = document.getElementById('tipocont');
                var tipoVal = tipoSelec.value;
                if (tipoVal !== 'None') {
                    pertenece(e.feature, tipoVal);
                    generarQR();                  
                } else {
                	alert("Seleccione un tipo para el contenedor");   
                	          	
                }
                layerWFS.getSource().clear();
                layerWFS.getSource().refresh();                                
            });
            break;

        case 'btnLine':
            interaction = new ol.interaction.Draw({
                type: 'LineString',
                source: layerWFS.getSource()
            });
            map.addInteraction(interaction);
            interaction.on('drawend', function (e) {
                transactWFS('insert', e.feature);
            });
            break;

        case 'btnArea':
            interaction = new ol.interaction.Draw({
                type: 'Polygon',
                source: layerWFS.getSource()
            });
            interaction.on('drawend', function (e) {
                transactWFS('insert', e.feature);
            });
            map.addInteraction(interaction);
            break;

        case 'btnDelete':
            interaction = new ol.interaction.Select();
            interaction.getFeatures().on('add', function (e) {
            //    layerWFS.getSource().removeFeature(e.target.item(0));
            	//console.log(e.target.item(0).getId() + 'COSO');
                transactWFS('delete', e.target.item(0));
                layerWFS.getSource().removeFeature(e.target.item(0));
                interactionSelectPointerMove.getFeatures().clear();
                interaction.getFeatures().clear();
            });
            map.addInteraction(interaction);
            break;

        case 'btnCho':
            interaction = new ol.interaction.Select();
            interaction.getFeatures().on('add', function (e) {
            //todo
            	var tipore;
            	switch (e.target.item(0).get('tresiduos')) {
            	case 0:
					tipore= "Plastico";
                	break;
            	case 1:
            		tipore= "Pilas";
                	break;
            	case 2:
            		tipore= "Papel";
            		break;
            	case 3:
            		tipore= "Organico";
                	break;
            	case 4:
            		tipore= "Vidrio";
                	break;
                
                	
            	}
                var info = document.getElementById('infoCont');
                info.innerHTML = '';
                if (e.target.item(0).getId().includes("cont")){
                info.innerHTML = e.target.item(0).getId() + '  TIPO: ' + tipore + '  ID Zona: ' + e.target.item(0).get('zona_idzona');
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
		</div>
	</div>



	
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
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