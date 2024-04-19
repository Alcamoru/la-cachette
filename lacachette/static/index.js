// Initialize and add the map
let map;

async function initMap() {
    // The location of Uluru
    const position = { lat: 43.65632, lng: -1.44387 };
    // Request needed libraries.
    //@ts-ignore
    const { Map } = await google.maps.importLibrary("maps");
    const { AdvancedMarkerView } = await google.maps.importLibrary("marker");

    // The map, centered at Uluru
    map = new Map(document.getElementById("map"), {
        zoom: 14,
        center: position,
        mapId: "DEMO_MAP_ID",
    });

    // The marker, positioned at Uluru
    const marker = new AdvancedMarkerView({
        map: map,
        position: position,
        title: "Uluru",
    });
}

initMap();