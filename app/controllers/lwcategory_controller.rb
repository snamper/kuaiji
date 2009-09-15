class LwcategoryController < ApplicationController
  
  def index
    list
    render :action => :list
  end

  def list
    @lwcategorys = Lwcategory.find(:all)
  end

  def new
    @lwcategory = Lwcategory.new
    @groups = Group.find(:all)
  end

  def create
    puts params[:sel]
    @lwcategory = Lwcategory.new(params[:lwcategory])
    if @lwcategory.save
      unless params[:ids].nil?
        params[:ids].each { |item|
          user = User.find(item)
          user.lwcategory_id = @lwcategory.id
          user.save
        }
      end
      flash[:notice] = '论文分类添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @lwcategory = Lwcategory.find(params[:id])
    @groups = Group.find(:all)
  end

  def update
    @lwcategory = Lwcategory.find(params[:id])
    if @lwcategory.update_attributes(params[:lwcategory])
      unless params[:ids].nil?
        params[:ids].split(",").each { |item|
          user = User.find(item)
          user.lwcategory_id = params[:id]
          user.save
        }
      end
      flash[:notice] = '论文分类修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Lwcategory.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

end
