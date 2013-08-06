# window.onload = ->
$ ->
  $("#submit").on "click", (event) ->
    set_gps()
    # $("#new_pin").submit()

set_gps = ->
  navigator.geolocation.getCurrentPosition update, handleError

#位置が検出されたら緯度、経度、誤差と時間を設定
update = (position) ->
  lat = position.coords.latitude #緯度
  lng = position.coords.longitude #経度
  acc = position.coords.accuracy #誤差
  $('#pin_lat').val(lat)
  $('#pin_lng').val(lng)
  $('#pin_acc').val(acc)
  $("#pin_form").submit()

#取得失敗のアラートを表示する
handleError = (error) ->
  result = ""
  switch error.code
    when 1
      result = "位置情報の取得が許可されていません"
    when 2
      result = "位置情報の取得に失敗しました"
    when 3
      result = "タイムアウトしました"
  alert result

