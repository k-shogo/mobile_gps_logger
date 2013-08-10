# window.onload = ->
$ ->
  $("#submit").on "click", (event) ->
    watchID = set_gps()
    setTimeout (->
      navigator.geolocation.clearWatch watchID
      $("#pin_form").submit()
    ), 3000

set_gps = ->
  watchID = navigator.geolocation.watchPosition(
    successCallback,
    errorCallback,
    {
      enableHighAccuracy: true,
      timeout: 5000,
      maximumAge: 0
    }
  )
  return watchID

#位置が検出されたら緯度、経度、誤差と時間を設定
successCallback = (position) ->
  latitude = position.coords.latitude # 緯度
  longitude = position.coords.longitude # 経度
  accuracy = position.coords.accuracy # 緯度・経度の精度
  altitude = position.coords.altitude # GPS高度
  altitudeAccuracy = position.coords.altitudeAccuracy # GPS 高度の精度
  heading = position.coords.heading # 移動方向
  speed = position.coords.speed # 移動速度
  $('#pin_latitude').val(latitude)
  $('#pin_longitude').val(longitude)
  $('#pin_accuracy').val(accuracy)
  $('#pin_altitude').val(altitude)
  $('#pin_altitude_accuracy').val(altitudeAccuracy)
  $('#pin_heading').val(heading)
  $('#pin_speed').val(speed)
  # $("#pin_form").submit()

#取得失敗のアラートを表示する
errorCallback = (error) ->
  result = ""
  switch error.code
    when 1
      result = "位置情報の取得が許可されていません"
    when 2
      result = "位置情報の取得に失敗しました"
    when 3
      result = "タイムアウトしました"
  alert result

