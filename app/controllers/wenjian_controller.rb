class WenjianController < ApplicationController
  
  def index
    list
    render :action => :list
  end

  def start
    @wenjian = Wenjian.new
  end

  def create
    @wenjian = Wenjian.new(params[:wenjian])
    @wenjian.flag = 0
    @wenjian.flowstep_id = 0
    if @wenjian.save
      flash[:notice] = '添加成功'
      redirect_to :action => 'flow', :id => @wenjian.id
    else
      render :action => 'create'
    end
  end

  def flow
    @wenjian = Wenjian.find(params[:id])

    if @wenjian.flowstep_id == 0
      @flowstep = Flowstep.find(:first, :conditions => ["workflow_id =? and seq = ?", @wenjian.workflow_id,1])
    end
    #if @wenjian.flowstep_id == 0
    #  @flowstep = @wenjian.workflow.flowsteps
    #end
    #Flowstep.find_all_by_workflow_id
  end

  def list
  end

  def new
  end

  def edit
  end

end
