require 'test_helper'
require 'generators/consense/consent_prompt/consent_prompt_generator'

module Consense
  class ConsentPromptGeneratorTest < Rails::Generators::TestCase
    tests ConsentPromptGenerator
    destination Rails.root.join('tmp/generators')
    setup :prepare_destination

    test "generator runs without errors" do
      assert_nothing_raised do
        run_generator ["my_deal"]
      end
    end
  end
end
