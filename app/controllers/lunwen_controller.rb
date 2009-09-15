class LunwenController < ApplicationController
  
  def index
    list
    render :action => :list
  end

  def list
    @lunwens = Lunwen.find(:all, :conditions => "delflag=0")
  end

  def trash
    @lunwens = Lunwen.find(:all, :conditions => "delflag=1")
  end

  #论文评审列表页
  def pingshen
    user = User.find(session[:user_id])
    user.lwcategory_id = 0 if user.lwcategory_id.nil?
    sql_str = "lwcategory_id = " + user.lwcategory_id.to_s
    @lunwens = Lunwen.find(:all, :conditions => sql_str)
    @user_id = session[:user_id]
  end

  #论文评审显示页
  def pingshenshow
    @lunwen = Lunwen.find(params[:id])
    @scoretypes = Scoretype.find(:all)
	sql = "user_id = " + session[:user_id].to_s + " and lunwen_id = " + @lunwen.id.to_s
    @score = Score.find(:first, :conditions => sql)
	if @score.nil?
		@score = Score.new
		@score.lunwen_id = @lunwen.id
	end
  end

  def new
    @lunwen = Lunwen.new
  end

  def create

    unless params[:lunwen]['filepath'] == ""
      filename = upload_file(params[:lunwen]['filepath'])
      params[:lunwen]['filepath'] = filename
    end

    @lunwen = Lunwen.new(params[:lunwen])
    @lunwen.score = 0
    if @lunwen.save
      flash[:notice] = '论文添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @lunwen = Lunwen.find(params[:id])
  end

  def update
    @lunwen = Lunwen.find(params[:id])

    unless params[:lunwen]['filepath'] == ""
      filename = upload_file(params[:lunwen]['filepath'])
      params[:lunwen]['filepath'] = filename
    else
      params[:lunwen]['filepath'] = @lunwen.filepath
    end

    if @lunwen.update_attributes(params[:lunwen])
      flash[:notice] = '论文修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    #Lunwen.find(params[:id]).destroy
    lunwen = Lunwen.find(params[:id])
    lunwen.delflag = 1
    lunwen.save
    redirect_to :action => 'list'
  end

  def revert
    lunwen = Lunwen.find(params[:id])
    lunwen.delflag = 0
    lunwen.save
    redirect_to :action => 'trash'
  end
  
  def score
	@scores = Score.find(:all, :conditions => "lunwen_id = " + params[:id].to_s)
  end

  def upload_file(file)
    unless file.original_filename.empty?
       @filename = get_file_name(file.original_filename.split(".").last)
       File.open("#{RAILS_ROOT}/public/upload/lunwen/#{@filename}", "wb") do |f|
       f.write(file.read)
       end
       return @filename
     end
  end

  def get_file_name(filename)
     if !filename.nil?
       Time.now.strftime("%Y_%m_%d_%H_%M_%S") + '.' + filename
     end
  end

end
