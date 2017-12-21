module Consent
  class ConsentsController < ApplicationController
    before_action :set_consent

    def approve
      @consent.approve!
      head :ok
    end

    def deny
      @consent.deny!
      head :ok
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
