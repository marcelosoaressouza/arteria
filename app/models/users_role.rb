class UsersRole < ActiveRecord::Base
  belongs_to :user
  belongs_to :role

  attr_accessible :user_id, :role_id
end
