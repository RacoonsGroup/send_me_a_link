$(document).ready ->
  $(".slug-input").keyup ->
    $(".slug-output")[0].value = URLify($(this)[0].value, $(this)[0].length)

  $(".checkbox").click ->
    if $(this).is(":checked")
      $(".slug-output")[0].setAttribute "disabled", "disabled"
    else
      $(".slug-output")[0].removeAttribute "disabled"
