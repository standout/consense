require 'test_helper'

module Consense
  class ConsentTest < ActiveSupport::TestCase
    test "has a valid fixture" do
      assert consense_consents(:default)
    end

    test "is undetermined per default" do
      assert Consent.new.undetermined?
    end

    test "saves date when responding" do
      consent = consense_consents(:default)

      consent.approve!
      assert_equal Date.current, consent.responded_at
    end

    test "sets the status when approving" do
      consent = consense_consents(:default)

      consent.approve!
      assert_equal :approved, consent.status
    end

    test "sets the status when denying" do
      consent = consense_consents(:default)

      consent.approve!
      assert_equal :approved, consent.status
    end

    test "can only respond once" do
      consent = consense_consents(:default)

      consent.approve!
      consent.deny!

      assert_equal :approved, consent.status
    end
  end
end
