ActionController::Routing::Routes.draw do |map|
# =>  map.resources :users, :active_scaffold => :user

  map.login   '/login',  :controller => 'admin/admin', :action => :login
  map.logout  '/logout', :controller => 'admin/admin', :action => :logout

  map.namespace :admin do |admin|
    admin.resources :tags, :active_scaffold  => :tag
    admin.connect '/tags/:id/do_add_user', :controller=>"tags", :action=>"do_add_user_link"
    admin.connect '/tags/:id/add_user',    :controller=>"tags", :action=>"add_user_link"
  end

  map.root :controller => :home
  map.tag  '/:permalink', :controller => :home, :action => :index
  map.tag  '/:permalink.:format', :controller => :home, :action => :show

#  map.tag  '/:permalink.:format', :controller => :home, :action => :show
  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
#  map.connect ':controller/:action/:id'
#  map.connect ':controller/:action/:id.:format'
end
