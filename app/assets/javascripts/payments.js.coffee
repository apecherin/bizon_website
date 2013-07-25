
#jQuery ->
#  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
#  payment.setupForm()

#payment =
#  setupForm: ->
#    $('#new_subscription').submit ->
#      $('input[type=submit]').attr('disabled', true)
#      if $('#card_number').length
#        subscription.processCard()
#        false
#      else
#        true

#  $("#payment-form").submit (e) ->
#  $form = $(this)
#  $form.find("button").prop "disabled", true
#  Stripe.createToken $form, stripeResponseHandler
#  false
#stripeResponseHandler = (status, response) ->
#  $form = $("#payment-form")
#  if response.error
#    $form.find(".payment-errors").text response.error.message
#    $form.find("button").prop "disabled", false
#  else
##    token = response.id
#    $form.append $("<input type=\"hidden\" name=\"stripeToken\" />").val(token)
#    $form.get(0).submit()

#jQuery ($) ->
#  $("#payment-form").submit (e) ->
#    $form = $(this)
#    $form.find("button").prop "disabled", true
#    Stripe.createToken $form, stripeResponseHandler
#    false


jQuery ->
  console.log('query')
  Stripe.setPublishableKey($('meta[name="stripe-key"]').attr('content'))
  payment.setupForm()

payment =
  setupForm: ->
    console.log('form')
    $("#payment-form").submit (e) ->
      console.log('proc_form')
      $form = $(this)
      $form.find("button").prop "disabled", true
      Stripe.createToken $form, stripeResponseHandler
      false

stripeResponseHandler = (status, response) ->
  $form = $("#payment-form")
  if response.error
    $form.find(".payment-errors").text response.error.message
    $form.find("button").prop "disabled", false
  else
    token = response.id
    $form.append $("<input type=\"hidden\" name=\"stripeToken\" />").val(token)
    $form.get(0).submit()