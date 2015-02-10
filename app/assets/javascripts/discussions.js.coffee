$('body.discussions').ready ->
  withActions 'edit new update create show', (action) ->
    editor = new Simditor
      textarea: $('.simditor')
      toolbar: ['bold', 'italic', 'underline', '|', 'ol', 'ul', 'blockquote', 'code', '|', 'link', 'image', 'hr']
