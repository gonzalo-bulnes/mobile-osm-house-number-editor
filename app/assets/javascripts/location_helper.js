$(document).ready(function(){
  /*
   * Create a preview map using the CloudMade Leaflet library
   * Provide HTML5 geolocation
   * Provide some interaction between the map and the house number form
   *
   */

  /* Map variables
     See http://leaflet.cloudmade.com/examples.html */

  var map = $('#map');
  var cloudmadeUrl = 'http://{s}.tile.cloudmade.com/dda9e9fdba4e42fe829f737c8032a2b3/997/256/{z}/{x}/{y}.png';
  var cloudmadeAttribution = 'Map data &copy; 2012 OpenStreetMap contributors, Imagery &copy; 2012 CloudMade';
  var cloudmade = new L.TileLayer(cloudmadeUrl, {maxZoom: 18, attribution: cloudmadeAttribution});

  /* Form variables */

  var latitude = $('#house_number_latitude', '#new_house_number');
  var longitude = $('#house_number_longitude', '#new_house_number');
  var preview = $('#preview', '#new_house_number');
  var locate = $('#locate', '#new_house_number');

  /* Utility functions */

  var disablePreview = function(){
    //
    // .disabled elements are not displayed
    // CSS property 'display' is set to 'none'
    //
    preview.addClass('disabled');
  }

  var onLocationError = function(event){
    alert(event.message);
  }

  var previewLocation = function(){
    const DEFAULT_PREVIEW_ZOOM = 17; // house numbers are visible

    // get the location from the house numbers form
    var newLocation = new L.LatLng(latitude.val(), longitude.val());

    // center the map on the given location
    map.setView(newLocation, DEFAULT_PREVIEW_ZOOM);
  }

  var setHouseNumberLocationFromMapCenter = function(event){
    //
    // Set the latitude and longitude form inputs
    // from the coordinated of the center of the map.
    //
    // e : L.Event, provided by the Leaflet library
    //

    const PRECISION = 7; // See http://wiki.openstreetmap.org/wiki/Node

    var mapCenter = event.target.getCenter();

    latitude.val( mapCenter.lat.toFixed(PRECISION) );
    longitude.val( mapCenter.lng.toFixed(PRECISION) );

    // when the map center and the form location match, previewing is useless
    disablePreview();
  }

  var updatePreviewStatus = function(event){
    //
    // Enable or disable the preview trigger depending on whether
    // or not both latitude and longitude fields are filled in.
    //
    if ( latitude.val().length && longitude.val().length ) {
      preview.removeClass('disabled');
    } else {
      preview.addClass('disabled');
    }
  }

  /* Map initialization */

  if ( map.length ){
    map = new L.Map('map');
    map.addLayer( cloudmade );
    map.on('locationerror', onLocationError);

    // load the map taking into account the pre-defined location if any
    if ( latitude.val() && longitude.val() ){
      previewLocation();
    } else {
      map.locateAndSetView();
    }

    /* Geolocalization */

    if ( locate.length ){
      locate.click( function(event){
        map.locateAndSetView();
        event.preventDefault();
      });
    }

    /* House Numbers form and Map Interaction */

    if ( preview.length && latitude.length && longitude.length ){

      // Update the latitude and longitude when the map is dragged
      map.on('dragend', setHouseNumberLocationFromMapCenter);

      // Update the preview element status in case
      // lat and lng fields were pre-filled.
      updatePreviewStatus();
      latitude.blur(updatePreviewStatus);
      longitude.blur(updatePreviewStatus);

      // Preview action
      preview.click( function(event){
        if ( latitude.val().length && longitude.val().length ){
          previewLocation();
        } else {
          alert('This is a bug, please report it! (Bug ID: 091)');
        }
        event.preventDefault();
      });
    }
  }
});
