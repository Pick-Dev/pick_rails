class V1::ImageUploadController < ApplicationController
  before_action :set_user, only: :update

  def update
   @user.photos.create(params[:image])
  end

  private

  def set_user
    params[:user_id] ||= 1
    @user = User.find(params[:user_id])
  end
end
