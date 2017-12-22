require 'test_helper'

module Consense
  class ConsentsControllerTest < ActionController::TestCase
    test "can approve an agreement" do
      user = users(:bob)

      put :approve, name: "my_deal", user_id: user.id, use_route: "consent"

      assert Agreement.new("my_deal", user).approved?
    end

    test "redirects to approved path when approved" do
      user = users(:bob)

      put :approve,
          name: "my_deal",
          user_id: user.id,
          use_route: "consent",
          approved_path: approved_path

      assert_redirected_to approved_path
    end

    test "can deny an agreement" do
      user = users(:bob)

      put :deny, name: "my_deal", user_id: user.id, use_route: "consent"

      assert Agreement.new("my_deal", user).denied?
    end

    test "redirects to denied path when denied" do
      user = users(:bob)

      put :deny,
          name: "my_deal",
          user_id: user.id,
          use_route: "consent",
          denied_path: denied_path

      assert_redirected_to denied_path
    end

    test "approving or denying logs a new consent" do
      user = users(:bob)

      assert_difference "Consent.count" do
        put :approve, name: "my_deal", user_id: user.id, use_route: "consent"
      end

      assert_difference "Consent.count" do
        put :deny, name: "my_deal", user_id: user.id, use_route: "consent"
      end
    end

    test "renders prompt template by name" do
      user = users(:bob)

      get :prompt, name: "my_deal", user_id: user.id, use_route: "consent"

      assert_template "my_deal"
    end
  end
end
