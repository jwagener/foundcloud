class UsersController < AdminController
  active_scaffold :user do
    list.columns.exclude :avatar_url, :updated_at, :created_at
  end
end

