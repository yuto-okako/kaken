module MissionsHelper
  def getted?(num)
    Mission.find_by(user_id: current_user.id, number: num)
  end
  
  def cleared?(num)
    if num == 1
      return inputed?
    elsif num == 2
      return checked?
    end
  end
  
  def btn_str(num)
    str = '未クリア'
    str = 'GET!' if cleared?(num)
    str = 'GET済' if getted?(num)
    return str
  end
end

def get_point
  if checked?
    data = Check.find_by(user_id: current_user.id, date: Time.zone.today).achieve
    if data
      data = data.split(' / ')
      pnt = data.size
      pnt *= 2 if pnt == @check_list.size
    else
      pnt = 0
    end
    return pnt
  end
end