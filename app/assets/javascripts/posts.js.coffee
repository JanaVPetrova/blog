# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.comment-on-this').click ->
    id = $(@).context.id
    $("#new_post_comment").find(".alert").remove()
    $("#new_post_comment").prepend("<div class='alert'><i>Вы собираетесь комментировать комментарий №#{id}<i></div>")
    $("#post_comment_parent_id").val(id)

  $("#new_post_comment")
    .bind "ajax:complete", (event, data) ->
      $("#post-comments").append("<div class='well well-small'>One new comment</div>")
