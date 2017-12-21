require 'test_helper'

module Consent
  class ConsentsControllerTest < ActionController::TestCase
    test "can approve an agreement" do
      user = users(:bob)

      put :approve, name: "my_deal", user_id: user.id, use_route: "consent"

      assert Agreement.new("my_deal", user).approved?
    end

    test "can deny an agreement" do
      user = users(:bob)

      put :deny, name: "my_deal", user_id: user.id, use_route: "consent"

      assert Agreement.new("my_deal", user).denied?
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
  end
end
