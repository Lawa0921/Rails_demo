class UsersController < ApplicationController
  skip_before_action :check_login, expect: [:logout]

  def login
    @user = User.new
  end

  def logout
    session[:ccc9527] = nil
    redirect_to root_path, notice: '成功登出!'
  end

  def sign_up
    @user = User.new
  end

  def sign_in
    user = User.find_by(email: user_params[:email], password: user_params[:password])
    
    if user
      session[:ccc9527] = user.id
      redirect_to root_path, notice: '登入成功!'
    else
      redirect_to login_path, notice: '登入失敗!'
    end
  end

  def registration
    user = params[:user]

      @user = User.new(user_params)

      if @user.save
        session[:ccc9527] = @user.email
        # TODO: 密碼加密
        redirect_to "/", notice: '註冊成功!'
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