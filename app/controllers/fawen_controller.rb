class FawenController < ApplicationController

  def index
    list
    render :action => :list
  end

  def list
    @fawens = Fawen.find(:all)
  end

  def new
    @fawen = Fawen.new
  end

  def create

    unless params[:fawen]['filename'] == ""
      filename = upload_file(params[:fawen]['filename'])
      params[:fawen]['filename'] = filename
    end

    @fawen = Fawen.new(params[:fawen])
    @fawen.user_id = session[:user_id]
    if @fawen.save
      flash[:notice] = '发文添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @fawen = Fawen.find(params[:id])
  end

  def show
    @fawen = Fawen.find(params[:id])
  end

  def update

    @fawen = Fawen.find(params[:id])

    unless params[:fawen]['filename'] == ""
      filename = upload_file(params[:fawen]['filename'])
      params[:fawen]['filename'] = filename
    else
      params[:fawen]['filename'] = @fawen.filename
    end

    if @fawen.update_attributes(params[:fawen])
      flash[:notice] = '发文修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    Fawen.find(params[:id]).destroy
    redirect_to :action => 'list'
  end

  def upload_file(file)
    unless file.original_filename.empty?
       @filename = get_file_name(file.original_filename.split(".").last)
       File.open("#{RAILS_ROOT}/public/upload/fawen/#{@filename}", "wb") do |f|
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
