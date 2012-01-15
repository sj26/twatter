jQuery ($) ->
  if ($form = $("#new_tweet")).length
    $textarea = $form.find("textarea")
    $charsLeft = $('<span class="chars-left">140</span>')
    $form.find('.btn').before $charsLeft
    $textarea.keyup ->
      value = $textarea.val()
      charsLeft = 140 - value.length
      $charsLeft.text(charsLeft).toggleClass("over", charsLeft < 0)
      $replyTo = $form.find('#tweet_reply_to_id')
      $h2 = $form.find("h2")
      if $replyTo.val() and value.indexOf("@#{$h2.text().match(/^Reply to (.+)$/)[1]}") < 0
        $replyTo.val("")
        $h2.text("What's Happening?")

    unless $("body").is(".tweets-new")
      $hideShow = $form.find(".hide-show").hide()
      $textarea.focus ->
        $form.addClass "expanded"
        $hideShow.show()

    $(".tweets").on "click", ".tweet .reply a", (e) ->
      e.preventDefault()
      $tweet = $(e.target).parents(".tweet")
      id = $tweet.attr("id").match(/^tweet_(\d+)$/)[1]
      name = $tweet.find('.user').text()
      $("#new_tweet #tweet_reply_to_id").val id
      $("#new_tweet h2").text "Reply to #{name}"
      $textarea = $("#new_tweet textarea")
      $textarea.val("@#{name} #{$textarea.val()}")
      $textarea.focus().get(0).setSelectionRange($textarea.val().length, $textarea.val().length)


