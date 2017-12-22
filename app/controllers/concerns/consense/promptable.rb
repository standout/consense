require 'active_support/concern'

module Consense::Promptable
  def self.included(base)
    base.send :include, InstanceMethods
    base.include Rails.application.routes.url_helpers
  end

  module InstanceMethods
    def prompt_consent(name, user_method: :current_user)
      return if Consense::disable_prompts_in_test_environment && Rails.env.test?
      user = send(user_method)
      return if user.blank?
      return if Consense::Agreement.new(name, user).approved?
      return if controller_name == "consents" && action_name == "prompt"
      redirect_to consense.prompt_consent_path(name, user.id)
    end
  end
end
