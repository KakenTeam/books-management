class UsersController < ApplicationController

  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  def index
    @users = User.where(activated: true).paginate(page: params[:page],
                                                  per_page: 10)
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_mail
      flash[:info] = "Please check your email to activate you account."
      redirect_to root_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)

      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted!"
    redirect_to users_url
  end


  private
    def user_params
      params.require(:user).permit(:name, :email, :phone, :address, :password,
                                   :password_confirmation)
    end

    # Confirm correct user, otherwise redirected to root url
    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user)
        flash[:warning] = "You're not enouch permission to edit an other account."
        redirect_to root_path
      end
    end

    def admin_user
      unless current_user_admin?
        flash[:danger] = "You're not admin user!"
        redirect_to root_url
      end
    end
end
