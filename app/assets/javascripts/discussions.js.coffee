initSimditor = ->
  editor = new Simditor
    textarea: $('.simditor')
    toolbar: ['bold', 'italic', 'underline', '|', 'ol', 'ul', 'blockquote', 'code', '|', 'link', 'image', 'hr']


$('body.discussions').ready ->
  withActions 'edit new update create show', ->
    initSimditor()

$('body.comments').ready ->
  withActions 'edit update', ->
    initSimditor()