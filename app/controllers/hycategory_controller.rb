class HycategoryController < ApplicationController

  def index
    list
    render :action => :list
  end

  def list
    @hycategories = Hycategory.find(:all, :conditions => "delflag=0")
  end

  def trash
    @hycategories = Hycategory.find(:all, :conditions => "delflag=1")
  end

  def new
    @hycategory = Hycategory.new
  end

  def create
    @hycategory = Hycategory.new(params[:hycategory])
    if @hycategory.save
      flash[:notice] = '行业分类添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @hycategory = Hycategory.find(params[:id])
  end

  def update
    @hycategory = Hycategory.find(params[:id])
    if @hycategory.update_attributes(params[:hycategory])
      flash[:notice] = '行业分类修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    #Hycategory.find(params[:id]).destroy
    hycg = Hycategory.find(params[:id])
    hycg.delflag = 1
    hycg.save
    redirect_to :action => 'list'
  end

  def revert
    hycg = Hycategory.find(params[:id])
    hycg.delflag = 0
    hycg.save
    redirect_to :action => 'trash'
  end

end
