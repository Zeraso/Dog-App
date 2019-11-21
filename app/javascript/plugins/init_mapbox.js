import mapboxgl from 'mapbox-gl';

const mapElement = document.getElementById('map');

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 11, duration: 0 });
}


const createGeoJSONCircle = (center, radiusInKm, points) => {
    if(!points) points = 64;

    var coords = {
        latitude: center[1],
        longitude: center[0]
    };

    var km = radiusInKm;

    var ret = [];
    var distanceX = km/(111.320*Math.cos(coords.latitude*Math.PI/180));
    var distanceY = km/110.574;

    var theta, x, y;
    for(var i=0; i<points; i++) {
        theta = (i/points)*(2*Math.PI);
        x = distanceX*Math.cos(theta);
        y = distanceY*Math.sin(theta);

        ret.push([coords.longitude+x, coords.latitude+y]);
    }
    ret.push(ret[0]);

    return {
        "type": "geojson",
        "data": {
            "type": "FeatureCollection",
            "features": [{
                "type": "Feature",
                "geometry": {
                    "type": "Polygon",
                    "coordinates": [ret]
                }
            }]
        }
    };
};

const addSourceToMap = (map, marker) => {
  map.addSource("polygon", createGeoJSONCircle([marker.lng, marker.lat], 1));

  map.addLayer({
      "id": "polygon",
      "type": "fill",
      "source": "polygon",
      "layout": {},
      "paint": {
          "fill-color": "blue",
          "fill-opacity": 0.3
      }
  });
}

const initMapbox = () => {
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/c-ctf/ck38slo5j00sc1cqc8lkrep6p'
      // style: 'mapbox://styles/mapbox/streets-v10'
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    map.on('load', (event) => {
      console.log("map loaded")
      if (markers.length === 1) {
        addSourceToMap(map, markers[0])
      }
    })
    markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      // .addTo(map);


    fitMapToMarkers(map, markers);

    });
  }
};

export { initMapbox };
