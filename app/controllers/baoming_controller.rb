class BaomingController < ApplicationController
  def list
  end

  def new
  end

  def create
    @baoming = Baoming.new(params[:baoming])
    if @baoming.save
      flash[:notice] = '报名成功，如为多人报名，请继续填写！'
      redirect_to :controller => 'index', :action => 'huiyishow', :id => @baoming.huiyi_id
    else
      render :action => 'new'
    end
  end

  def edit
  end

end
