class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where.not(id: current_user.id).order(:id)
  end

  def edit
  end

  def update
  end
end
