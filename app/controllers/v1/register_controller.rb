class V1::RegisterController < ApplicationController

  before_action :set_phone_number
  def show
    verify_code = rand(10000..99999)
    params = {
      mobile: @phone_number,
      template_id: 1843,
      vars: "注册|#{verify_code}"
    }
    res = Httparty.post('https://sms-api.upyun.com/api/messages', params)
    if res.ok?
      User.create(phone: @phone_number, name: params[:name], code: verify_code)
      head :ok
    else
      render json: { message: 'sms error', status: '401' }
    end
  end


  private
  def set_phone_number
    @phone_number = params[:set_phone_number]
  end
end
