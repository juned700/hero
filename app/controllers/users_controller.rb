class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :udpate, :destroy]
  before_action :require_signin, except: [:new, :create]
  before_action :require_correct_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
    @registrations = @user.registrations
  end

  def new
    @user = User.new
  end

  def create
  
    @user = User.new(user_params)
  
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user, notice: 'Account has been successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Account has been successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    session[:user_id] = nil
    redirect_to users_path, notice: "Account has been deleted"
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end

    def set_user
      @user = User.find(params[:id])
    end

    def require_correct_user
      unless is_currect_user?(@user)
        flash[:error] = "you are not a correct user!"
        redirect_to root_path
      end
    end
end
