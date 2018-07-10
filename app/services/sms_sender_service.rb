class SmsSenderService

  def initialize
    @base_url = 'https://sms-api.upyun.com/api/messages'
  end
    
  def execute
    Httparty.post(@base_url, params)
  end
end