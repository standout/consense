module Consent
  class ConsentsController < ApplicationController
    include Rails.application.routes.url_helpers

    before_action :set_consent

    def prompt
      render "consent_prompts/#{params[:name]}"
    end

    def approve
      @consent.approve!
      if params[:approved_path]
        redirect_to params[:approved_path]
      else
        head :ok
      end
    end

    def deny
      @consent.deny!
      if params[:denied_path]
        redirect_to params[:denied_path]
      else
        head :ok
      end
    end

    private

    def set_consent
      @consent = Consent.new(
        name: params[:name],
        user_id: params[:user_id]
      )
    end
  end
end
