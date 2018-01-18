class InterviewsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user = current_user
    @interviews = current_user.interviews
  end

  def new
  end

  def create
  end
end
