class HomeController < ApplicationController
  def index
    @tags = Tag.all(:order => 'position ASC')
  end

  def show
    @tag = Tag.find_by_permalink(params[:permalink])
    raise ActiveRecord::RecordNotFound if @tag.nil?  
  end

end
