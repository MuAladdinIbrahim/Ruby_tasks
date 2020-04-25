class UsersController < ApplicationController
  def new
    @user = User.new
  end
  def index
  end
  def create 
    @user = User.new(user_params)
    if @user.save
      flash[:notice]="success - wish you a happy usage"
      flash[:color]="valid"
    else
      flash[:notice]="failed"
      flash[:color]="invalid"
    end
    render "new"
  end
  private
      def user_params
        params.require(:user).permit(:username,:email,:password)
      end

end
