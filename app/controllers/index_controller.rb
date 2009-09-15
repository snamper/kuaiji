class IndexController < ApplicationController
  def index

    @guanggao = Guanggao.first

    @article1 = Article.find_all_by_category_id(1, :limit => 8, :order => "id desc")
    @article2 = Article.find_all_by_category_id(2, :limit => 8, :order => "id desc")
    @article3 = Article.find_all_by_category_id(3, :limit => 8, :order => "id desc")
	
	@article4 = Article.find_all_by_category_id(4, :limit => 8, :order => "id desc")

    @huiyis = Huiyi.find(:all,:conditions => "ispub=1 and delflag=0", :limit => 8, :order => "id desc")
    render :layout => 'index'
  end

  def list
    @guanggao = Guanggao.first
    @category = Category.find(params[:id])
    @articles = Article.find_all_by_category_id(params[:id], :order => "id desc")
    render :layout => 'index'
  end

  def show
    @guanggao = Guanggao.first
    @article = Article.find(params[:id])
    render :layout => 'index'
  end

  def huiyishow
    @guanggao = Guanggao.first
    @huiyi = Huiyi.find(params[:id])
  end

  def huiyilist
    @guanggao = Guanggao.first
    @huiyis = Huiyi.find(:all, :conditions => "ispub=1 and delflag=0", :order => "id desc")
  end

  def content
    @guanggao = Guanggao.first
    @webconfig = Webconfig.find(params[:id])
  end

  #保存报名信息
  def bmcreate
    @baoming = Baoming.new(params[:baoming])
    if @baoming.save
      flash[:notice] = '报名成功，如为多人报名，请继续填写！'
      redirect_to :controller => 'index', :action => 'huiyishow', :id => @baoming.huiyi_id
    else
      render :action => 'new'
    end
  end

  def search
    @guanggao = Guanggao.first
    @articles = Article.find(:all, :conditions => ['title like ?', "%" + params[:title] + "%"])
  end

  def zhuanjia
    @zhuanjia = Zhuanjia.find(params[:id])
    render :layout => false
  end

end
