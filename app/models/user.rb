class User < ActiveRecord::Base
  extend Enumerize
  acts_as_voter

  acts_as_authentic do |config|
    config.login_field = 'email'

    # Use legacy crypto provider.
    config.crypto_provider = Authlogic::CryptoProviders::BCrypt
  end

  alias_attribute :to_s, :username
  enumerize :role, in: [:admin, :member], default: :member

  validates_presence_of :username, :email, :role
  validates_presence_of :password, :password_confirmation, on: :create
  validates_uniqueness_of :username
  validates_format_of :username, with: /\A\S+\z/, message: '不能包含空格'

  def avatar_url(size=64)
    "#{Settings.gavatar.proxy}/#{email_md5}.png?s=#{size}&w=#{Settings.gavatar.default}"
  end

  ## Callbacks
  before_create :set_email_md5

  def set_email_md5
    self.email_md5 = Digest::MD5.hexdigest(self.email || '')
  end
end
