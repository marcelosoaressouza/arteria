class Role < ActiveRecord::Base
  scopify

  has_many :users_roles, :dependent => :destroy
  has_many :users, :through => :users_roles

  belongs_to :resource, :polymorphic => true

  attr_accessible :name, :resource_id, :resource_type
end
