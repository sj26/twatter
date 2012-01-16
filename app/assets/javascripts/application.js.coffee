#= require jquery
#= require jquery_ujs
#= require bootstrap-alerts
#= require bootstrap-modal
#= require_tree .
#= require_self

jQuery ($) ->
  $("[data-standard-text]").each ->
    $self = $(this)
    $self
      .data("hover-text", $self.html())
      .data('hover-class', $self.attr('class'))
      .attr('class', $self.data('standard-class') || "standard")
      .css('transition', 'none')
      .css('webkitTransition', 'none')
      .html($self.data("standard-text"))
      .hover ->
        $self
          .attr('class', $self.data('hover-class'))
          .html($self.data("hover-text"))
      , ->
        $self
          .attr('class', $self.data('standard-class'))
          .html($self.data("standard-text"))

