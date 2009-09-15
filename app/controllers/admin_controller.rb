class AdminController < ApplicationController
  def index
    @current_user = User.find_by_id(session[:user_id])
    @ziyuans = @current_user.group.ziyuans.find(:all, :conditions => 'parent_id=0')
    @small_ziyuans = @current_user.group.ziyuans.find(:all, :conditions => 'parent_id!=0')
    render :layout => false
  end

  def welcome
    
  end

end
