$ ->
  $("a").not(".noreplace").click ->
    location.href = $(this).attr("href")
    false
