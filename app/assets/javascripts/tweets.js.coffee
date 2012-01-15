jQuery ($) ->
  $("#new_tweet").each ->
    $form = $(this)
    $textarea = $form.find("textarea")
    $charsLeft = $('<span class="chars-left">140</span>')
    $form.find('.btn').before $charsLeft
    $textarea.keyup ->
      charsLeft = 140 - $(this).val().length
      $charsLeft.text(charsLeft).toggleClass("over", charsLeft < 0)
    unless $("body").is(".tweets-new")
      $form.removeClass("expanded")
      $hideShow = $form.find(".hide-show")
      $hideShow.hide()
      $textarea.focus ->
        $form.addClass "expanded"
        $hideShow.show()

