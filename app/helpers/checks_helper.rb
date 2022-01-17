module ChecksHelper
  def checked?
    Check.find_by(user_id: current_user.id, date: Time.zone.today)
  end
  
  def beforeShow(dt)
    @res = dt.split(' / ')
    while @res.size < 6
      @res.push('')
    end
  end
end
