class HuiyiController < ApplicationController
  
  def index
    list
    render :action => :list
  end

  def list
    @huiyis = Huiyi.find(:all, :conditions => "delflag=0")
  end

  def trash
    @huiyis = Huiyi.find(:all, :conditions => "delflag=1")
  end

  def new
    @huiyi = Huiyi.new
    @huiyi.status = 0
    @huiyi.ispub = 1
  end

  def create
    @huiyi = Huiyi.new(params[:huiyi])
    if @huiyi.save
      flash[:notice] = '会议添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def show
    @huiyi = Huiyi.find(params[:id])
  end

  def edit
    @huiyi = Huiyi.find(params[:id])
  end

  def update
    @huiyi = Huiyi.find(params[:id])
    if @huiyi.update_attributes(params[:huiyi])
      flash[:notice] = '会议修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end
  
  def bmupdate
    @baoming = Baoming.find(params[:id])
    if @baoming.update_attributes(params[:baoming])
      flash[:notice] = '报名修改成功'
      redirect_to :action => 'show', :id => @baoming.huiyi_id
    else
      render :action => 'edit'
    end
  end

  def destroy
    #Huiyi.find(params[:id]).destroy
    huiyi = Huiyi.find(params[:id])
    huiyi.delflag = 1
    huiyi.save
    redirect_to :action => 'list'
  end

  def revert
    huiyi = Huiyi.find(params[:id])
    huiyi.delflag = 0
    huiyi.save
    redirect_to :action => 'trash'
  end
  
  def editbm
    @baoming = Baoming.find(params[:id])
  end
  
  def destroybm
	@baoming = Baoming.find(params[:id])
    @baoming.destroy
    redirect_to :action => 'show', :id => @baoming.huiyi_id
  end

end
