class ApplicationController < ActionController::Base
  include SessionsHelper
  include TemperaturesHelper
  include ChecksHelper
  include MissionsHelper
  include GamesHelper
  
  before_action :const
  
  def const
    if logged_in?
      @user = current_user
    end
    @health_check = ['頭痛', '腹痛', 'のどの痛み', '咳', '倦怠感', 'くしゃみ・鼻水', '下痢・嘔吐', 'めまい']
    @check_list = ['外出時はマスク着用', 'こまめに手洗い・手指消毒', '３密(密集・密接・密閉)の回避',
                   '帰宅後、まず手洗い', 'ソーシャルディスタンス(最低１m)', '時差通勤・時差通学']
  end
end