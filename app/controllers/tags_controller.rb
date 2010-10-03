class TagsController < AdminController
  active_scaffold :tag do |config|
    list.columns.exclude :users, :image_url, :updated_at, :created_at
    list.sorting = {:position => 'ASC'}
    action_links.add 'add_user_link', :type => :member, :label => 'Add User'

  #    show.link.action :view_action
  #    show.link.inline true    
  end
  
  def add_user_link
    @tag = Tag.find_by_id(params[:id])
  end

  def do_add_user_link
    @tag = Tag.find_by_id(params[:id])
    urls = params[:tag][:urls].to_s.split("\n").compact.map(&:strip).reject(&:blank?)
    
    urls.each do |url|
      u = User.from_url(url)
      u.tag_id = @tag.id
      u.save
    end
    
    redirect_to url_for(:action => 'edit', :id => @tag.id)
  end
  
end
