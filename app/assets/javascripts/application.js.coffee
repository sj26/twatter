#= require jquery
#= require jquery_ujs
#= require bootstrap-alerts
#= require_tree .

jQuery ($) ->
  console.log $(".new_tweet")
  $(".new_tweet")
    .find(".hide-show").hide().end()
    .find("textarea").focus ->
      console.log $(this)
      $(this)
        .parents(".new_tweet").addClass("focused")
          .find(".hide-show").show()

