class LoginController < ApplicationController
  def login
    session[:user_id] = nil
    if request.post?
      puts params[:name]
      puts params[:password]
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        redirect_to(:controller => "admin", :action => "index")
      else
        flash[:notice] = "无效的用户名或密码，请重新输入"
      end
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "您已成功退出！"
    redirect_to(:action => "login")
  end

end
