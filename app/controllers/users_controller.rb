class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end 
def new 
  @user = User.new
  
end
def edit 
  @user = User.find(params[:id])

end

  def create 
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "User was successflly created"
      UserMailer.welcome_email(@user).deliver_now
    else
      render:new
    end
    
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice: 'User was successfully updated.'
    end
    end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
    redirect_to root_path, notice: 'User was successfully deleted.'
    end
  end 

  private
  
  def user_params 
    params.require(:user).permit(:name, :email)   
  end

end
