class WorkflowController < ApplicationController
  
  def index
    list
    render :action => :list
  end

  def list
    @workflows = Workflow.find(:all)
  end

  def show
    @current_user = User.find_by_id(session[:user_id])
    @groups = Group.find(:all)
    @workflow = Workflow.find(params[:id])
    @flowstep = Flowstep.new
    @flowstep.workflow_id = params[:id]
    @flowstep.endflag = 0
  end

  def new
    @workflow = Workflow.new
  end

  def create
    @workflow = Workflow.new(params[:workflow])
    if @workflow.save
      flash[:notice] = '工作流添加成功'
      redirect_to :action => 'show', :id => @workflow.id
    else
      render :action => 'new'
    end
  end

  #为工作流添加执行步骤
  def addstep
    @flowstep = Flowstep.new(params[:flowstep])
    if @flowstep.save
      flash[:notice] = '步骤添加成功'
      redirect_to :action => 'show', :id => @flowstep.workflow_id
    else
      render :action => 'show', :id => @flowstep.workflow_id
    end
  end

  def edit
    @workflow = Workflow.find(params[:id])
  end

  def editstep
    @flowstep = Flowstep.find(params[:id])
  end

  def savestep
    @flowstep = Flowstep.find(params[:id])
    if @flowstep.update_attributes(params[:flowstep])
      flash[:notice] = '步骤修改成功'
      redirect_to :action => 'show', :id => @flowstep.workflow_id
    else
      render :action => 'edit'
    end
  end

  def update
    @workflow = Workflow.find(params[:id])
    if @workflow.update_attributes(params[:workflow])
      flash[:notice] = '工作流修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Workflow.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  #删除流程步骤
  def destroystep
    @step = Flowstep.find(params[:id])
    @flowid = @step.workflow_id
    @step.destroy
    redirect_to :action => 'show', :id => @flowid
  end

end
