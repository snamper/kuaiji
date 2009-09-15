class ConfigController < ApplicationController

  def new
    @webconfig = Webconfig.new
  end

  def edit
    @webconfig = Webconfig.find(params[:id])
  end

  def update
    @webconfig = Webconfig.find(params[:id])
    if @webconfig.update_attributes(params[:webconfig])
      flash[:notice] = '修改成功'
      redirect_to :action => 'edit', :id => params[:id]
    else
      render :action => 'edit'
    end
  end

end
