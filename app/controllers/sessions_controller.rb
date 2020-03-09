class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:email].downcase #{sessions {email: '',password: ''}}
    password = params[:session][:password] #{sessions {email: '',password: ''}}
    if login(email, password)
      flash[:success] = 'ログインが成功しました'
      redirect_to root_url
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  private

  def login(email, password)
    @user = User.find_by(email: email)
    if @user && @user.authenticate(password) #新演算としてnilとfalse以外はtrue
      # ログイン成功
      session[:user_id] = @user.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
