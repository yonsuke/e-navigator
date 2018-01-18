class InterviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @interviews = current_user.interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = current_user.interviews.build(interview_params)
    if @interview.save
      flash[:notice] = "面接候補日を追加しました"
      redirect_to user_interviews_path
    else

    end
  end

  private

    def interview_params
      params.require(:interview).permit(:start_time)
    end

end
