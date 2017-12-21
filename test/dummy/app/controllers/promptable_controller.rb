class PromptableController < ApplicationController
  include Rails.application.routes.url_helpers
  include Consent::Promptable

  before_action do
    prompt_consent :my_deal,
                   approved_path: approved_path,
                   denied_path: denied_path
  end

  def current_user
    User.first
  end

  def index; head :ok; end

  def approved; head :ok; end
  def denied; head :ok; end
end
