class V1::LoginController < ApplicationController
  def index
    render json: {
      available_platform: ['wechat', 'weibo']
    }
  end

  def show

    if params[:platform] == 'wechat'
      render json: {
        userid: 1,
      }
    elsif params[:platform] == 'weibo'
    end
  end

  private
end
