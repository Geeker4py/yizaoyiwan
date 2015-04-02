$(document).ready ->
  $('.simditor').simditor
    upload:
      url: '/upload/image'
      params: null
      fileKey: 'image'
      connectionCount: 3
      leaveConfirm: '正在上传文件，如果离开上传会自动取消'