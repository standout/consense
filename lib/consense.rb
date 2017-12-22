require "consense/engine"

module Consense
  class << self
    mattr_accessor :disable_prompts_in_test_environment
    self.disable_prompts_in_test_environment = true
  end

  def self.setup(&block)
    yield self
  end
end
