class InterviewsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = User.find(params[:user_id])
    @interviews = @user.interviews
  end

  def new
    @interview = Interview.new
  end

  def create
    @interview = current_user.interviews.build(interview_params)
    if @interview.save
      flash.now[:notice] = "面談候補日を追加しました"
      render 'show'
    else
      render 'new'
    end
  end

  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    user_id = @interview.user_id
    if user_id == current_user.id
      if @interview.update_attributes(interview_params)
        flash.now[:notice] = "面談候補日を更新しました"
        render 'show'
      else
        render 'edit'
      end
    else
      interviews = Interview.where(user_id: user_id).update_all(status: :rejected)
      @interview.approved!
      flash.now[:notice] = "面談日を設定しました"
      render 'show'
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
