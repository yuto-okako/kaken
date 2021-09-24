class MissionsController < ApplicationController
  def create
    @mission = Mission.new(mission_params)
    @mission.user_id = current_user.id
    if @mission.save
      if @mission.reward_type == 'point'
        @profile = Profile.find_by(user_id: current_user.id)
        new_point = @profile.point + @mission.reward.to_i
        @profile.update(point: new_point)
      end
    end
    @id = @mission.number
  end
  
  private
  
  def mission_params
    params.permit(:number, :reward_type, :reward, :dayly)
  end
end
