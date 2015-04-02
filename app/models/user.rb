class User < ActiveRecord::Base
  extend Enumerize

  alias_attribute :to_s, :username
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  enumerize :role, in: [:user, :admin], default: :user

  ACCESSABLE_ATTRS = [:email, :username, :password, :password_confirmation]

  ## Attributes

  def avatar_url(size=64)
    "#{Settings.gavatar.proxy}/#{email_md5}.png?s=#{size}&w=#{Settings.gavatar.default}"
  end

  ## Callbacks
  before_create :set_email_md5

  def set_email_md5
    self.email_md5 = Digest::MD5.hexdigest(self.email || '')
  end
end
