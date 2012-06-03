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

// Form elements
var latInput = document.getElementById('house_number_latitude');
var lngInput = document.getElementById('house_number_longitude');

// Map
var map = new L.Map('map', { zoomControl: false });

var cloudmadeUrl = 'http://{s}.tile.cloudmade.com/dda9e9fdba4e42fe829f737c8032a2b3/997/256/{z}/{x}/{y}.png',
  cloudmadeAttribution = 'Map data &copy; 2012 OpenStreetMap contributors, Imagery &copy; 2012 CloudMade',
  cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttribution});

map.addLayer(cloudmade);

/* FIXME The 'locationfound' event shouldn't interfere with invalid forms! */
// map.on('locationfound', setHouseNumberLocationFromMapCenter);
map.on('locationerror', onLocationError);
map.on('dragend', setHouseNumberLocationFromMapCenter);
/* FIXME The 'moveend' event should be enough, however it makes tha map unresponsive
map.on('moveend', setHouseNumberLocationFromMapCenter); */

map.locateAndSetView();

function onLocationError(e) {
  alert(e.message);
}

function setHouseNumberLocationFromMapCenter(e) {
  /* Set the latitude and longitude form inputs
   * from the coordinated of the center of the map.
   *
   * e : L.Event, provided by the Leaflet library
   */

  const PRECISION = 7; // See http://wiki.openstreetmap.org/wiki/Node

  var mapCenter = e.target.getCenter();

  latInput = document.getElementById('house_number_latitude');
  lngInput = document.getElementById('house_number_longitude');

  latInput.value = mapCenter.lat.toFixed(PRECISION);
  lngInput.value = mapCenter.lng.toFixed(PRECISION);
}
