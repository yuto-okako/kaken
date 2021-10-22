class ApplicationController < ActionController::Base
  include SessionsHelper
  include TemperaturesHelper
  include ChecksHelper
  include MissionsHelper
  include GamesHelper
  
  before_action :const
  
  def const
    @health_check = ['頭痛', '腹痛', 'のどの痛み', '咳', '倦怠感', 'くしゃみ・鼻水', '下痢・嘔吐', 'めまい']
    @check_list = ['外出時はマスクを着けましたか？', '適時手指消毒をしましたか？', '３密を避けましたか？']
  end
end