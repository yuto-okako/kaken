module TemperaturesHelper
  #今日健康観察を行っていたらtrueを返す
  def inputed?
    Temperature.find_by(user_id: current_user.id, date: Time.zone.today)
  end
  
  def highTemp(temp)
    return 'high-temp' if temp >= 37.5
  end
  
  def notFeel(data)
    return data != '' ? 'not-feel' : 'good-feel'
  end
end