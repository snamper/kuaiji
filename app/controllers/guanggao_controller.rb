class GuanggaoController < ApplicationController

  def index
    show
    render :action => :show
  end

  def show
    @guanggao = Guanggao.first
    @type = params[:type]
  end

  def update
    @guanggao = Guanggao.find(params[:id])

#    unless params[:guanggao]['file1'] == ""
#      filename1 = upload_file(params[:guanggao]['file1'])
#      params[:guanggao][:file1] = filename1
#      params[:guanggao][:ad1] += filename1
#    end
#
#    unless params[:guanggao]['file2'] == ""
#      filename2 = upload_file(params[:guanggao]['file2'])
#      params[:guanggao][:file2] = filename2
#      params[:guanggao][:ad2] += filename2
#    end
#
#    unless params[:guanggao]['file3'] == ""
#      filename3 = upload_file(params[:guanggao]['file3'])
#      params[:guanggao][:file3] = filename3
#      params[:guanggao][:ad3] += filename3
#    end
#
#    unless params[:guanggao]['file4'] == ""
#      filename4 = upload_file(params[:guanggao]['file4'])
#      params[:guanggao][:file4] = filename4
#      params[:guanggao][:ad4] += filename4
#    end

    if @guanggao.update_attributes(params[:guanggao])
      flash[:notice] = '广告修改成功'
      redirect_to :action => 'show', :type => params[:type]
    else
      render :action => 'edit'
    end
  end

  def upload_file(file)
    unless file.original_filename.empty?
       @filename = get_file_name(file.original_filename)
       File.open("#{RAILS_ROOT}/public/upload/ad/#{@filename}", "wb") do |f|
       f.write(file.read)
       end
       return @filename
     end
  end

  def get_file_name(filename)
     if !filename.nil?
       Time.now.strftime("%Y_%m_%d_%H_%M_%S") + '_' + filename
     end
  end
end
