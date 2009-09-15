class ScoretypeController < ApplicationController

  def index
    list
    render :action => :list
  end

  def list
    @scoretypes = Scoretype.find(:all)
  end

  def new
    @scoretype = Scoretype.new
  end

  def create
    @scoretype = Scoretype.new(params[:scoretype])
    if @scoretype.save
      flash[:notice] = '评审项添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def addlevel
    @scorelevel = Scorelevel.new(params[:scorelevel])
    if @scorelevel.save
      flash[:notice] = '分值项添加成功'
      redirect_to :action => 'show', :id => @scorelevel.scoretype
    else
      render :action => 'show', :id => @scorelevel.scoretype
    end
  end

  def edit
    @scoretype = Scoretype.find(params[:id])
  end

  def show
    @scoretype = Scoretype.find(params[:id])
    @scorelevel = Scorelevel.new
    @scorelevel.scoretype_id = params[:id]
  end

  def update
    @scoretype = Scoretype.find(params[:id])
    if @scoretype.update_attributes(params[:scoretype])
      flash[:notice] = '评审项修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Scoretype.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def destroylevel
    @sl = Scorelevel.find(params[:id])
    @typeid = @sl.scoretype
    @sl.destroy
    redirect_to :action => 'show', :id => @typeid
  end

end
