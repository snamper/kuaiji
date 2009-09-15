class ScoreController < ApplicationController
  def create
    sql = "user_id = " + session[:user_id].to_s + " and lunwen_id = " + params[:score][:lunwen_id].to_s
    @score = Score.find(:first, :conditions => sql)
    if @score.nil?
      @score = Score.new(params[:score])
      @score.user_id = session[:user_id]
      lunwen = Lunwen.find(@score.lunwen_id)
      lunwen.score = lunwen.score + @score.total_value
    else
      lunwen = Lunwen.find(@score.lunwen_id)
	  @score.content = params[:score][:content]
      lunwen.score = lunwen.score - @score.total_value
      @score.total_value = params[:score][:total_value]
      lunwen.score = lunwen.score + @score.total_value
    end

    if @score.save
      lunwen.save
      flash[:notice] = '评分成功'
      redirect_to :controller => 'lunwen', :action => 'pingshen'
    else
      render :action => 'new'
    end
  end
end
