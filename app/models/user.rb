class User < ActiveRecord::Base
  extend Enumerize
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enumerize :role, in: [:user, :admin], default: :user
  
  ACCESSABLE_ATTRS = [:email, :username, :password, :password_confirmation]
end
