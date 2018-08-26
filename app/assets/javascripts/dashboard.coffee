# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

csrf_token = $('meta[name="csrf-token"]').attr('content')
$.ajaxPrefilter (options, originalOptions, jqXHR) ->
  if options.type.toLowerCase() == 'post'
# initialize `data` to empty string if it does not exist
    options.data = options.data or ''
    # add leading ampersand if `data` is non-empty
    options.data += if options.data then '&' else ''
    # add _token entry
    options.data += 'authenticity_token=' + encodeURIComponent(csrf_token)
