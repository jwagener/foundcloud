class TagsController < AdminController
  active_scaffold :tag do
    list.columns.exclude :users, :image_url
    list.sorting = {:position => 'ASC'}
    nested.add_link("Users", [:users])
    
  end
  
end
