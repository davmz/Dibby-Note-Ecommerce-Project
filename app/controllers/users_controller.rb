class UsersController < ApplicationController
  http_basic_authenticate_with name: "admin", password: "password", only: [:index]

  def index
    @users = User.all
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
      flash[:success] = "Welcome to DibbyNote, #{@user.fullname}}"
      redirect_to @user
      # redirect_to root_path, notice: "Successfully created account"
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:first, :last, :fullname, :email, :password,
                                   :password_confirmation)
    end
end
