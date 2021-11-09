class Mails::SearchesController < ApplicationController
  def index
    @unique = User.find_by(email: params[:mail]) ? false : true
    respond_to do |format|
      format.html { redirect_to new_user_path }
      format.json { render json: @unique }
    end
  end
end