class ShouwenController < ApplicationController
  def index
    list
    render :action => :list
  end

  def list
    @shouwens = Shouwen.find(:all)
  end
  
  def myreglist
    @shouwens = Shouwen.find_all_by_user_id(session[:user_id])
  end

  def mylist
    @shouwens = Shouwen.find_all_by_receive_user_id(session[:user_id])
  end

  def piyue
    @shouwen = Shouwen.find(params[:id])
  end

  def new
    @shouwen = Shouwen.new
  end

  def show
    @shouwen = Shouwen.find(params[:id])
  end

  def create

    unless params[:shouwen]['filename'] == ""
      filename = upload_file(params[:shouwen]['filename'])
      params[:shouwen]['filename'] = filename
    end

    @shouwen = Shouwen.new(params[:shouwen])
    @shouwen.status = 0
    @shouwen.user_id = session[:user_id]
    if @shouwen.save
      flash[:notice] = '收文登记成功'
      redirect_to :action => 'sendfile', :id => @shouwen.id
    else
      render :action => 'new'
    end
  end

  def update

    @shouwen = Shouwen.find(params[:id])

    unless params[:shouwen]['filename'] == ""
      filename = upload_file(params[:shouwen]['filename'])
      params[:shouwen]['filename'] = filename
    else
      params[:shouwen]['filename'] = @shouwen.filename
    end
    
    if @shouwen.update_attributes(params[:shouwen])
      flash[:notice] = '收文登记成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def destroy
    Shouwen.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def sendfile
    @groups = Group.find(:all)
    @shouwen = Shouwen.find(params[:id])
  end

  def savesend
    @shouwen = Shouwen.find(params[:id])
    @shouwen.receive_user_id = params[:showwen][:receive_user_id]
    @shouwen.status = 1
    if @shouwen.save
      flash[:notice] = '发送成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def savepiyue
    @shouwen = Shouwen.find(params[:id])
    @shouwen.status = 2
    @shouwen.pycontent = params[:pycontent]
    if @shouwen.save
      flash[:notice] = '批阅成功'
      redirect_to :action => 'mylist'
    else
      render :action => 'edit'
    end
  end

  def edit
    @shouwen = Shouwen.find(params[:id])
  end

  def upload_file(file)
    unless file.original_filename.empty?
       @filename = get_file_name(file.original_filename.split(".").last)
       File.open("#{RAILS_ROOT}/public/upload/shouwen/#{@filename}", "wb") do |f|
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
