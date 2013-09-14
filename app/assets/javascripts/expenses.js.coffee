# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ($) ->

  # validate the form server-side
  $("form[data-remote='true']").remoteValidation()

  # parse the data server-side
  $("input#expense_date[data_parse_date='true']").change ->
    $this = $(this)
    date = $this.val()
    $.ajax '/parse_date',
      type: 'POST',
      data: { 'date': date }
      error: ->
        $this.addClass('error').removeClass('success')
      success: (json) ->
        $this.addClass('success').removeClass('error')
        $this.val(json.date)
