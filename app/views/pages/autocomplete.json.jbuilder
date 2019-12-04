json.array! @places do |marker|
  json.name marker.name
  json.city marker.city
  json.street marker.street
  json.lat marker.latitude
  json.lng marker.longitude
  json.infoWindow render(partial: "places/info_window", locals: { place: marker }, formats: [:html])
  json.image_url asset_url('logo2.png')
end
