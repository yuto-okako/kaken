module ChecksHelper
  def checked?
    Check.find_by(user_id: current_user.id, date: Date.today)
  end
end
