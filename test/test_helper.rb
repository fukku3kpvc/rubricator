ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  # Add more helper methods to be used by all tests here...
  def sign_in(account)
    user = FactoryBot.build(account)
    user.save
    post user_session_path, params: { user: { email: user.email,
                                              password: user.password } }
    assert_redirected_to root_path
  end
end
