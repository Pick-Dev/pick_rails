# frozen_string_literal: true

class V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render josn: @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
