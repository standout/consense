require 'test_helper'
include Consense::Engine.routes.url_helpers

class PromptableControllerTest < ActionController::TestCase
  test "renders prompt if denied" do
    user = users(:bob)
    Consense::Consent.new(user: user, name: "my_deal").deny!

    get :index, user_id: user.id

    # assert_redirected_to "/prompt_consent/my_deal/#{user.id}"
    assert_redirected_to prompt_consent_path("my_deal", user.id)
  end

  test "renders prompt if user haven't responded" do
    user = users(:bob)

    get :index, user_id: user.id

    assert_redirected_to prompt_consent_path("my_deal", user.id)
  end

  test "ignores public sessions" do
    get :index

    assert_response :ok
  end
end
