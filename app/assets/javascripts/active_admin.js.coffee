#= require active_admin/base
#= require lib/redactor

$ ->
  $('textarea.redactor').each (index, el) ->
    $el = $(el)
    $el.redactor
      imageUpload: $el.data('upload-url')
