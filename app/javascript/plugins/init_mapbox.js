import mapboxgl from 'mapbox-gl';

let map = null;

const initMapbox = () => {
  const mapElement = document.getElementById('map');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;

    map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/mapbox/streets-v8',
      center: [-9.1431, 38.7064],
      zoom: 13
    });

    map.addControl(new mapboxgl.GeolocateControl({
      positionOptions: {
        enableHighAccuracy: true
      },
      trackUserLocation: true
    }));

    const markers = JSON.parse(mapElement.dataset.markers);
    showMarkers(markers);
  }
};

let previousMarkers = [];

export const showMarkers = (markers) => {
  if (markers != null) {
    previousMarkers.forEach(marker => marker.remove());



  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'contain';
      element.style.width = '40px';
      element.style.height = '51px';

    const addedMarker = new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);

    previousMarkers.push(addedMarker);
  });
}
  fitMapToMarkers(map, markers);
}

const fitMapToMarkers = (map, markers) => {
  if (markers != null) {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 });
}
};


export { initMapbox };
