class V1::ImageUploadController < ApplicationController
  before_action :set_user, only: :create

  def create
    binding.pry
    @user.photos.create(image: params[:image])
    render json: @user.photos.last.image.url
  end

  private

  def set_user
    params[:user_id] ||= 1
    @user = User.find(params[:user_id])
  end
end
