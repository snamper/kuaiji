class UserController < ApplicationController

  def index
    list
    render :action => :list
  end

  def list
    @users = User.find(:all, :conditions => "delflag=0")
  end

  def trash
    @users = User.find(:all, :conditions => "delflag=1")
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = '用户添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = '用户修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    #User.find(params[:id]).destroy
    user = User.find(params[:id])
    user.delflag = 1
    user.save
    redirect_to :action => 'list'
  end

  def revert
    user = User.find(params[:id])
    user.delflag = 0
    user.save
    redirect_to :action => 'trash'
  end

  def getuser
    @users = User.find_all_by_group_id(params[:group_id])
    respond_to do |format|
      format.json {
        render :json => @users.to_json
      }
    end
  end

end
