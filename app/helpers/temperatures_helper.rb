module TemperaturesHelper
  #今日健康観察を行っていたらtrueを返す
  def inputed?
    Temperature.find_by(user_id: current_user.id, date: Date.today)
  end
end