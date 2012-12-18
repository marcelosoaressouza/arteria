class User < ActiveRecord::Base
  rolify

  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :licenses, :dependent => :destroy
  has_many :images,   :dependent => :destroy
  has_many :videos,   :dependent => :destroy

  has_many :users_roles
  has_many :roles, :through => :users_roles

  accepts_nested_attributes_for :roles
  accepts_nested_attributes_for :users_roles

  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :users_roles_attributes


  validates :firstname, :presence => true,
                       :length => { :minimum => 4, :maximum => 254 }

  validates :lastname, :presence => true,
                       :length => { :minimum => 4, :maximum => 254 }

  after_create :assign_guest_role

  private
    def assign_guest_role
      self.add_role "guest"
    end
end
