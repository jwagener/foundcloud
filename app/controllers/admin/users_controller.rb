module Admin
  class UsersController < AdminController
    active_scaffold :user do
      list.columns.exclude :avatar_url, :updated_at, :created_at
  #    action_links.add 'add_user_link', :label => 'Add User'
    end
  end 
end