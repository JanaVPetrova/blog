# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.comment-on-this').click ->
    id = $(@).context.id
    $("#new_post_comment").append("<span>#{id}</span>")
    $("#post_comment_parent_id").val(id)