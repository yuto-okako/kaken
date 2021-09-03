class TemperaturesController < ApplicationController
  before_action :health_string, only: [:create]         #createアクションの前に実行
  
  def new
    @temperature = Temperature.new
  end
  
  def create
    @temperature = Temperature.new(temperature_params)
    @temperature.date = Date.today                      #日付は送られてこないので代入
    if @temperature.save
      redirect_to root_path
    else
      render 'temperatures/new'
    end
  end
  
  private
  def temperature_params
    params.require(:temperature).permit(:user_id, :taion, :health)
  end
  
  def health_string
    params[:temperature][:health] = params[:temperature][:health].join(' / ') if params[:temperature][:health]  #チェックが入っていれば、配列で送られるhealthを文字列に変換('/'区切り)
  end
end