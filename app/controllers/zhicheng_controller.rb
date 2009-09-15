class ZhichengController < ApplicationController

  def index
    list
    render :action => 'list'
  end

  def list
    @zhichengs = Zhicheng.find(:all, :conditions => "delflag = 0")
  end

  def trash
    @zhichengs = Zhicheng.find(:all, :conditions => "delflag = 1")
  end

  def new
    @zhicheng = Zhicheng.new
  end

  def create
    @zhicheng = Zhicheng.new(params[:zhicheng])
    if @zhicheng.save
      flash[:notice] = '职称添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @zhicheng = Zhicheng.find(params[:id])
  end

  def update
    @zhicheng = Zhicheng.find(params[:id])
    if @zhicheng.update_attributes(params[:zhicheng])
      flash[:notice] = '职称修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    #Zhicheng.find(params[:id]).destroy
    zhicheng = Zhicheng.find(params[:id])
    zhicheng.delflag = 1
    zhicheng.save
    redirect_to :action => 'list'
  end

  def revert
    zhicheng = Zhicheng.find(params[:id])
    zhicheng.delflag = 0
    zhicheng.save
    redirect_to :action => 'trash'
  end

end
