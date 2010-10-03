class HomeController < ApplicationController
  def index
    @tag = Tag.find_by_permalink(params[:permalink])
    @tags = Tag.all(:order => 'position ASC')
    p params[:permalink]
    p @tag
  end

  def show
    @tag = Tag.find_by_permalink(params[:permalink])
    raise ActiveRecord::RecordNotFound if @tag.nil?
    respond_to do |format|
      format.html
      format.xml  { render :xml =>  @tag.to_xml  }
      format.json { render :json => @tag.to_json }
    end
  end
end
