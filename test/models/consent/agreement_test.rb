require 'test_helper'

module Consent
  class AgreementTest < ActiveSupport::TestCase
    test "tells if a user approved, denied or responded to an agreement" do
      user = users(:bob)
      Consent.create!(
        name: "my_deal",
        user: user,
      ).approve!

      Consent.create!(
        name: "my_other_deal",
        user: user,
      ).deny!

      assert Agreement.new("my_deal", user).approved?
      refute Agreement.new("my_deal", user).denied?

      assert Agreement.new("my_other_deal", user).denied?
      refute Agreement.new("my_other_deal", user).approved?

      assert Agreement.new("my_deal", user).responded?
      assert Agreement.new("my_other_deal", user).responded?
      refute Agreement.new("my_third_deal", user).responded?
    end
  end
end
