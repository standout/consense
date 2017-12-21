require 'test_helper'
include Consent::Engine.routes.url_helpers

class PromptableControllerTest < ActionController::TestCase
  test "redirects to approved path if already approved" do
    user = users(:bob)
    Consent::Consent.new(user: user, name: "my_deal").approve!

    get :index, user_id: user.id

    assert_redirected_to approved_path
  end

  test "renders prompt if denied" do
    user = users(:bob)
    Consent::Consent.new(user: user, name: "my_deal").deny!

    get :index, user_id: user.id

    assert_redirected_to "/prompt_consent/my_deal/#{user.id}"
  end

  test "renders prompt if user haven't responded" do
    user = users(:bob)

    get :index, user_id: user.id

    assert_redirected_to "/prompt_consent/my_deal/#{user.id}"
  end
end
