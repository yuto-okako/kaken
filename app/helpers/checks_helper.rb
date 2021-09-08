module ChecksHelper
  def checked?
    Check.find_by(user_id: current_user.id, date: Time.zone.today)
  end
end
