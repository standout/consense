module Consent
  class Agreement
    attr_reader :name

    def initialize(name, user)
      @name = name
      @user = user
    end

    def approved?
      responded_with? "approved"
    end

    def denied?
      responded_with? "denied"
    end

    def responded?
      responses.any?
    end

    private

    def responded_with?(status)
      responses.send(status)
               .present?
    end

    def responses
      Consent.where("responded_at IS NOT NULL")
             .where(name: @name, user: @user)
    end
  end
end
