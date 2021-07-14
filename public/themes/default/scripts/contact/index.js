if ($("div.map-section").lenght) {
    //  /*google*/
    var google_satellite = L.tileLayer('https://{s}.google.com/vt/lyrs=s&x={x}&y={y}&z={z}',{
        maxZoom:20 ,
        subdomains:['mt0','mt1','mt2','mt3'] ,
    });

    var data_map = $("div#map") ;

    var map = L.map('map', {
        layers: [google_satellite] ,
        center: [38.912753, -77.032194],
        // zoom: osm_initialZoom,m,
        // minZoom : osm_minZoom ,
        // maxZoom : osm_maxZoo
        zoomControl : true,
        attributionControl : false
    }).setView([38.912753, -77.032194], 8);

    // L.marker([38.912753, -77.032194])
    //     .bindPopup("Hello <b>Leaflet GL</b>!<br>Whoa, it works!")
    //     .addTo(map)
    //     .openPopup();

    L.marker([38.912753, -77.032194], {
    icon: L.icon({
        iconUrl: data_map.data("icon-path") ,
        iconSize:     [50, 50], // size of the icon
        iconAnchor:   [25, 25], // point of the icon which will correspond to marker's location
        popupAnchor:  [0, -25]  // point from which the popup should open relative to the iconAnchor
    })
     }).addTo(map);

    // var gl = L.mapboxGL({
    //     accessToken: 'no-token',
    //     // get your own MapTiler token at https://cloud.maptiler.com/ or use MapBox style
    //     style: 'https://api.maptiler.com/maps/topo/style.json?key=gbetYLSD5vR8MdtZ88AQ'
    // }).addTo(map) ;
}
