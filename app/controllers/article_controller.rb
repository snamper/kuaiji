class ArticleController < ApplicationController
  
  def index
    list
    render :action => :list
  end

  def list
    @articles = Article.find(:all, :conditions => "delflag=0", :order => "id DESC")
  end

  def trash
    @articles = Article.find(:all, :conditions => "delflag=1", :order => "id DESC")
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    if @article.save
      flash[:notice] = '新闻添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    if @article.update_attributes(params[:article])
      flash[:notice] = '新闻修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    #Article.find(params[:id]).destroy
    arc = Article.find(params[:id])
    arc.delflag = 1
    arc.save
    redirect_to :action => 'list'
  end

  def revert
    #Article.find(params[:id]).destroy
    arc = Article.find(params[:id])
    arc.delflag = 0
    arc.save
    redirect_to :action => 'trash'
  end

end
