# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.comment-on-this').click ->
    id = $(@).context.id
    $("#new_post_comment").find("span").remove()
    $("#new_post_comment").prepend("<span><i>Вы собираетесь комментировать комментарий №#{id}<i></span>")
    $("#post_comment_parent_id").val(id)