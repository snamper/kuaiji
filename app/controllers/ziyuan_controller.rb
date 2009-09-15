class ZiyuanController < ApplicationController

  def index
    list
    render :action => :list
  end

  def list
    @ziyuans = Ziyuan.find(:all, :conditions => "parent_id=0 AND delflag=0", :order => "seq asc")
  end

  def trash
    @ziyuans = Ziyuan.find(:all, :conditions => "parent_id=0 AND delflag=1", :order => "seq asc")
  end

  def new
    @ziyuan = Ziyuan.new
  end

  def create
    params[:ziyuan][:parent_id] = 0 if params[:ziyuan][:parent_id] == ""
    @ziyuan = Ziyuan.new(params[:ziyuan])
    if @ziyuan.save
      flash[:notice] = '资源添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @ziyuan = Ziyuan.find(params[:id])
  end

  def update
    @ziyuan = Ziyuan.find(params[:id])
    if @ziyuan.update_attributes(params[:ziyuan])
      flash[:notice] = '资源修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    #Ziyuan.find(params[:id]).destroy
    zy = Ziyuan.find(params[:id])
    zy.delflag = 1
    zy.save
    redirect_to :action => 'list'
  end

  def revert
    zy = Ziyuan.find(params[:id])
    zy.delflag = 0
    zy.save
    redirect_to :action => 'trash'
  end

end
