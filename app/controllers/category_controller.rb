class CategoryController < ApplicationController
  
  def index
    list
    render :action => :list
  end

  def list
    @categories = Category.find(:all, :conditions => "delflag=0")
  end

  def trash
    @categories = Category.find(:all, :conditions => "delflag=1")
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params[:category])
    if @category.save
      flash[:notice] = '分类添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(params[:category])
      flash[:notice] = '分类修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    #Category.find(params[:id]).destroy
    cg = Category.find(params[:id])
    cg.delflag = 1
    cg.save
    redirect_to :action => 'list'
  end

  def revert
    #Category.find(params[:id]).destroy
    cg = Category.find(params[:id])
    cg.delflag = 0
    cg.save
    redirect_to :action => 'trash'
  end

end
