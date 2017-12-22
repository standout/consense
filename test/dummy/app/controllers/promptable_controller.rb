class PromptableController < ApplicationController
  include Rails.application.routes.url_helpers
  include Consense::Promptable

  before_action do
    prompt_consent :my_deal
  end

  def current_user
    User.find_by(id: params[:user_id])
  end

  def index; head :ok; end

  def approved; head :ok; end
  def denied; head :ok; end
end
