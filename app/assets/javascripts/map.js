/* map.js
 * 
 * This file is a modified version of a Leaflet usage example.
 * See leaflet.cloudmade.com/examples/mobile-example.html .
 *
 */
/* The default location could be:
 *   lat: -33.44487
 *   lon: -70.68820
 *   zoom: 15
 */
var map = new L.Map('map');

var cloudmadeUrl = 'http://{s}.tile.cloudmade.com/dda9e9fdba4e42fe829f737c8032a2b3/997/256/{z}/{x}/{y}.png',
  cloudmadeAttribution = 'Map data &copy; 2012 OpenStreetMap contributors, Imagery &copy; 2012 CloudMade',
  cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttribution});

map.addLayer(cloudmade);

map.on('locationfound', onLocationFound);
map.on('locationerror', onLocationError);

map.locateAndSetView();

function onLocationFound(e) {
  //var radius = e.accuracy / 2;

  //var marker = new L.Marker(e.latlng);
  //map.addLayer(marker);
  //marker.bindPopup("You are within " + radius + " meters from this point").openPopup();

  //var circle = new L.Circle(e.latlng, radius);
  //map.addLayer(circle);
}

function onLocationError(e) {
  alert(e.message);
}
