class UsersController < ApplicationController
  def login
    @user = User.new
  end

  def logout
    session[:ccc9527] = nil
    redirect_to root_path
  end

  def sign_up
    @user = User.new
  end

  def sign_in
    # 查資料庫
    user = User.find_by(email: user_params[:email], password: user_params[:password])
    # User.where(email: ?,password: ?)
    if user
      session[:ccc9527] = user.email
      redirect_to root_path
    else
      redirect_to login_path
    end
  end

  def registration
    user = params[:user]

      @user = User.new(user_params)

      if @user.save
        session[:ccc9527] = @user.email
        # TODO: 密碼加密
        redirect_to "/"
      else
        render :sign_up
      end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end

 # user = User.new(email: user[:email], password: user[:password]) 