module Consense
  class ConsentsController < ApplicationController
    include Rails.application.routes.url_helpers

    before_action :set_consent
    before_action :set_user_id

    def prompt
      respond_to do |format|
        format.html { return render "consent_prompts/#{params[:name]}" }
        format.json { head :ok }
      end
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

    def set_user_id
      @user_id = params[:user_id]
    end
  end
end
