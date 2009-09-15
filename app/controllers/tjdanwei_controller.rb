class TjdanweiController < ApplicationController
  
  def index
    list
    render :action => :list
  end

  def list
    @tjdanweis = Tjdanwei.find(:all)
  end

  def new
    @tjdanwei = Tjdanwei.new
  end

  def create
    @tjdanwei = Tjdanwei.new(params[:tjdanwei])
    if @tjdanwei.save
      flash[:notice] = '推荐单位添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @tjdanwei = Tjdanwei.find(params[:id])
  end

  def update
    @tjdanwei = Tjdanwei.find(params[:id])
    if @tjdanwei.update_attributes(params[:tjdanwei])
      flash[:notice] = '推荐单位修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Tjdanwei.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
