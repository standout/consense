require 'test_helper'

module Consent
  class ConsentTest < ActiveSupport::TestCase
    test "can be created" do
      assert Consent::Consent.create(
      ).persisted?
    end
  end
end
