class UploadController < ApplicationController
  def image
    @image = Image.new
    @image.image = params[:upload_file]

    if @image.save
      render json: { success: true, file_path: @image.image.url }
    else
      render json: { success: false, msg: '图片上传失败' }
    end
  end
end
