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
      flash[:notice] = "面談候補日を追加しました"
      redirect_to user_interviews_path
    else
      render 'new'
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update_attributes(interview_params)
      flash[:notice] = "面談候補日を更新しました"
      redirect_to user_interviews_path
    else
      render 'edit'
    end
  end

  def destroy
    Interview.find(params[:id]).destroy
    flash[:notice] = "面談候補日を削除しました"
    redirect_to user_interviews_path
  end

  private

    def interview_params
      params.require(:interview).permit(:start_time)
    end
end
