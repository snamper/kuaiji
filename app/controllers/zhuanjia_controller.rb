class ZhuanjiaController < ApplicationController

  def index
    list
    render :action => 'list'
  end

  def list
    @zhuanjias = Zhuanjia.find(:all, :conditions => "delflag=0", :order => 'code')
  end

  def trash
    @zhuanjias = Zhuanjia.find(:all, :conditions => "delflag=1", :order => 'code')
  end

  def new
    @zhuanjia = Zhuanjia.new
    @zhuanjia.sex = "男";
  end

  def create

    unless params[:zhuanjia]['photo'] == ""
      filename = upload_file(params[:zhuanjia]['photo'])
      params[:zhuanjia]['photo'] = filename
    end

    @zhuanjia = Zhuanjia.new(params[:zhuanjia])
    if @zhuanjia.save
      flash[:notice] = '专家添加成功'
      redirect_to :action => 'list'
    else
      render :action => 'new'
    end
  end

  def edit
    @zhuanjia = Zhuanjia.find(params[:id])
  end

  def show
    @zhuanjia = Zhuanjia.find(params[:id])
  end

  def update
    @zhuanjia = Zhuanjia.find(params[:id])

    if params[:zhuanjia]['photo'] == ""
      params[:zhuanjia]['photo'] = @zhuanjia.photo
    else
      filename = upload_file(params[:zhuanjia]['photo'])
      params[:zhuanjia]['photo'] = filename
    end

    if @zhuanjia.update_attributes(params[:zhuanjia])
      flash[:notice] = '专家修改成功'
      redirect_to :action => 'list'
    else
      render :action => 'edit'
    end
  end

  def destroy
    #Zhuanjia.find(params[:id]).destroy
    zhuanjia = Zhuanjia.find(params[:id])
    zhuanjia.delflag = 1
    zhuanjia.save
    redirect_to :action => 'list'
  end

  def revert
    zhuanjia = Zhuanjia.find(params[:id])
    zhuanjia.delflag = 0
    zhuanjia.save
    redirect_to :action => 'trash'
  end

  def search
    
  end

  def result
    sql_str = " 1=1"
    sql_str += " and name like '%" + params[:zhuanjia][:name] + "%'" unless params[:zhuanjia][:name] == ""
    sql_str += " and code like '%" + params[:zhuanjia][:code] + "%'" unless params[:zhuanjia][:code] == ""
    sql_str += " and sex like '%" + params[:zhuanjia][:sex] + "%'" unless params[:zhuanjia][:sex].nil?
    sql_str += " and age like '%" + params[:zhuanjia][:age] + "%'" unless params[:zhuanjia][:age] == ""
    sql_str += " and birthday like '%" + params[:zhuanjia][:birthday] + "%'" unless params[:zhuanjia][:birthday] == ""
    sql_str += " and nations like '%" + params[:zhuanjia][:nations] + "%'" unless params[:zhuanjia][:nations] == ""
    sql_str += " and political like '%" + params[:zhuanjia][:political] + "%'" unless params[:zhuanjia][:political] == ""
    sql_str += " and idno like '%" + params[:zhuanjia][:idno] + "%'" unless params[:zhuanjia][:idno] == ""
    sql_str += " and hukou like '%" + params[:zhuanjia][:hukou] + "%'" unless params[:zhuanjia][:hukou] == ""
    sql_str += " and phone like '%" + params[:zhuanjia][:phone] + "%'" unless params[:zhuanjia][:phone] == ""
    sql_str += " and email like '%" + params[:zhuanjia][:email] + "%'" unless params[:zhuanjia][:email] == ""
    sql_str += " and address like '%" + params[:zhuanjia][:address] + "%'" unless params[:zhuanjia][:address] == ""
    sql_str += " and zipcode like '%" + params[:zhuanjia][:zipcode] + "%'" unless params[:zhuanjia][:zipcode] == ""
    sql_str += " and zhicheng_id like '%" + params[:zhuanjia][:zhicheng_id] + "%'" unless params[:zhuanjia][:zhicheng_id] == ""
    sql_str += " and zhichengno like '%" + params[:zhuanjia][:zhichengno] + "%'" unless params[:zhuanjia][:zhichengno] == ""
    sql_str += " and diqu like '%" + params[:zhuanjia][:diqu] + "%'" unless params[:zhuanjia][:diqu] == ""
    sql_str += " and tjdanwei like '%" + params[:zhuanjia][:tjdanwei] + "%'" unless params[:zhuanjia][:tjdanwei] == ""
    sql_str += " and gzdanwei like '%" + params[:zhuanjia][:gzdanwei] + "%'" unless params[:zhuanjia][:gzdanwei] == ""
    sql_str += " and hycategory_id like '%" + params[:zhuanjia][:hycategory_id] + "%'" unless params[:zhuanjia][:hycategory_id] == ""
    sql_str += " and zhiwu like '%" + params[:zhuanjia][:zhiwu] + "%'" unless params[:zhuanjia][:zhiwu] == ""
    sql_str += " and xueli like '%" + params[:zhuanjia][:xueli] + "%'" unless params[:zhuanjia][:xueli] == ""
    sql_str += " and techang like '%" + params[:zhuanjia][:techang] + "%'" unless params[:zhuanjia][:techang] == ""
    sql_str += " and chuban like '%" + params[:zhuanjia][:chuban] + "%'" unless params[:zhuanjia][:chuban] == ""
    sql_str += " and jiangli like '%" + params[:zhuanjia][:jiangli] + "%'" unless params[:zhuanjia][:jiangli] == ""
    sql_str += " and othertechang like '%" + params[:zhuanjia][:othertechang] + "%'" unless params[:zhuanjia][:othertechang] == ""

    puts sql_str
    @zhuanjias = Zhuanjia.find(:all, :conditions => sql_str)

    #e = Excel::Workbook.new
    #e.addWorksheetFromArrayOfHashes("Books info", array)
  end

  def export
    headers['Content-Type'] = "application/vnd.ms-excel"
    headers['Content-Disposition'] = 'attachment; filename="excel-export.xls"'
    headers['Cache-Control'] = ''
    @zhuanjias = Zhuanjia.find(:all)
  end

  def upload_file(file)
    unless file.original_filename.empty?
       @filename = get_file_name(file.original_filename)
       File.open("#{RAILS_ROOT}/public/upload/zhuanjia/#{@filename}", "wb") do |f|
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
