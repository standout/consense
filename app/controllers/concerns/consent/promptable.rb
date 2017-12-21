require 'active_support/concern'

module Consent::Promptable
  def self.included(base)
    base.send :include, InstanceMethods
    base.include Rails.application.routes.url_helpers
  end

  module InstanceMethods
    def prompt_consent(name, approved_path:, denied_path:, user_method: :current_user)
      user = send(user_method)
      if Consent::Agreement.new(name, user).approved?
        redirect_to approved_path
      else
        redirect_to prompt_consent_path(name, user.id)
      end
    end
  end
end
