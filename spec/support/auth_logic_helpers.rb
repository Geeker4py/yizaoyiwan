require 'authlogic/test_case' 
include Authlogic::TestCase

module Authlogic
  module TestHelper
    def create_user_session(user)
      activate_authlogic
      UserSession.create(email: user.email, password: user.password)
    end
  end
end
