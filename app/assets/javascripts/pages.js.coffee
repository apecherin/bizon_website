# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

index =
  init: ->
    @slider()

  slider: ->
    $('.carousel').carousel
      interval: 5000


portfolio =
  init: ->
    do @modalInit

  modalInit: ->
    $('.portfolio .thumbnail').click (e) ->
      e.preventDefault()
      portfolio.getInfo($(@).data('id'))

  getInfo: (id) ->
    $.ajax
      url: "/pages/getInfoPortfolio"
      type: "POST"
      data:
        id: id
      dataType: "json"
      success: (res) ->
        $('.portfolio-info').empty()
        $('#myModalLabel').html(res.portfolio.name)
        $('#description').html(res.portfolio.description)
        $('#image').attr('src', res.portfolio.image.thumb.url)
        $('#url').attr('href', res.portfolio.url).html(res.portfolio.url)
        $.each res.developers, (key, developer) ->
          $('#developers').append('<li><a href="' + developer.odesk_link + '" target="_blank">' + developer.firstname + ' ' + developer.lastname + '</a></li>')
        $('#myModal').modal('show')


team =
  init: ->
    @modalInit()

  modalInit: ->
    $('.team .thumbnail').click (e) ->
      e.preventDefault()
      team.getInfo($(@).data('id'))

  getInfo: (id) ->
    $.ajax
      url: "/pages/getInfoUser"
      type: "POST"
      data:
        id: id
      dataType: "json"
      success: (res) ->
        $('.user-info').empty()
        $('#description').html(res.user.description)
        $('#user_name').html(res.user.firstname + ' ' + res.user.lastname)
        $('#role').html(res.user.role)
        $('#image').attr('src', res.user.avatar.thumb.url)
        $('#url').attr('href', res.user.odesk_link).html(res.user.odesk_link)
        $.each res.portfolios, (key, portfolio) ->
          $('#portfolios').append('<li><a href="' + portfolio.url + '" target="_blank">' + portfolio.name + '</a></li>')
        $('#myModal').modal('show')

$ ->
  index.init()
  portfolio.init()
  team.init()