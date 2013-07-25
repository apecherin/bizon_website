# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

comment =
  init: ->
    do @deleteComment
    do @newComment

  newComment: ->
    $('#contact #send').click (e) ->

      e.preventDefault()
      comment.addComment()

  deleteComment: ->
    $('#del_comm').mousedown (e) ->

      e.preventDefault()
      comment.removeComment()

  addComment: () ->
    $.ajax
      url: "/comments/addComment"
      type: "POST"
      data:
        comment:
          content: $('#msg').val()
          blog_id: $('#blog_id').val()
      success: (res) ->
          $('.close').trigger('click')
          location.reload()

  removeComment: () ->
    $.ajax
      url: "/comments/deleteComment"
      type: "POST"
      data:
          id: $('#comment_id').val()
      success: (res) ->
        $('.close').trigger('click')
        location.reload()

search =
  init: ->
    do @searchBlog

  searchBlog: ->
     $("#myTypeahead").typeahead
       source: (query, process) ->
         $.ajax
           url: "/search/autoComplete"
           type: "get"
           data:
             query: query

           contentType: "application/json; charset=utf-8"
           dataType: "json"
           success: (result) ->
             objects_label = []
             window.map_label = {}
             $.each result, (i, object) ->
               window.map_label[object.label] = object
               objects_label.push object.label
             process objects_label
       updater: (item) ->
         selectedPost = window.map_label[item].id
         $('#myTypeahead').val(item)
         do location.href = "/blogs/"+selectedPost



$ ->
  comment.init()
  search.init()
