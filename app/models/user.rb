class User < ActiveRecord::Base
  rolify

  # :token_authenticatable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname

  has_many :licenses, :dependent => :destroy
end
