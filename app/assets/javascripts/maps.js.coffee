$(document).ready ->
  postId = $('#map').data('post-id')

  $.get '/posts/' + postId + '.json', (post) ->
    map = new GMaps({
      div: '#map',
      lat: 51.365,
      lng: -0.095
    })

    GMaps.geocode({
      address: post.location,
      callback: (results, status) ->
        if (status == 'OK')
          latlng = results[0].geometry.location;
          map.setCenter(latlng.lat(), latlng.lng());
          map.addMarker({
            lat: latlng.lat(),
            lng: latlng.lng()
          })
    }) 
