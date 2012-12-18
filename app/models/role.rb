class Role < ActiveRecord::Base
  scopify

  has_many :users_roles, :dependent => :destroy
  has_many :users, :through => :users_roles

#  has_and_belongs_to_many :users, :join_table => :users_roles

  belongs_to :resource, :polymorphic => true
end
