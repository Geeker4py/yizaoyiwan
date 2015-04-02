#= require simditor

TOOLBAR = [
  'title'          # 标题文字
  'bold'           # 加粗文字
  'italic'         # 斜体文字
  'underline'      # 下划线文字
  # 'strikethrough'  # 删除线文字
  '|'
  'ol'             # 有序列表
  'ul'             # 无序列表
  'blockquote'     # 引用
  'code'           # 代码
  '|'
  # 'table'          # 表格
  'link'           # 插入链接
  'image'          # 插入图片
  'hr'             # 分割线
  '|'
  'indent'         # 向右缩进
  'outdent'        # 向左缩进
]
$.fn.extend
  simditor: (options) ->
    @each (i, textarea) ->
      $simditor = $(textarea)
      defaults =
        textarea: $simditor
        toolbar: TOOLBAR
        toolbarFloat: true
        defaultImage: 'http://simditor.tower.im/assets/images/image.png'

      unless $simditor.data('simditor')
        simditor = new Simditor($.extend(defaults, options))
        $simditor.data('simditor', simditor)

      $simditor