class GroupController < ApplicationController

  def index
    list
    render :action => :list
  end

  def list
    @groups = Group.find(:all, :conditions => "delflag=0")
  end

  def trash
    @groups = Group.find(:all, :conditions => "delflag=1")
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(params[:group])
    if @group.save
      flash[:notice] = '用户组添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(params[:group])
      flash[:notice] = '用户组修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def show
    @group = Group.find(params[:id])
    @ziyuans = Ziyuan.find(:all)
  end

  def destroy
    #Group.find(params[:id]).destroy
    group = Group.find(params[:id])
    group.delflag = 1
    group.save
    redirect_to :action => 'list'
  end

  def revert
    group = Group.find(params[:id])
    group.delflag = 0
    group.save
    redirect_to :action => 'trash'
  end

  def saverole
    @group = Group.find(params[:id])
    @group.ziyuans.clear
    unless params[:sel].nil?
      params[:sel].each { |item|
        ziyuan = Ziyuan.find(item)
        @group.ziyuans << ziyuan
      }
    end
    @group.save
    redirect_to :action => 'list'
  end

end
