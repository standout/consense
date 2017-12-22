module Consense
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
      response && response.send("#{status}?")
    end

    def response
      responses.last
    end

    def responses
      Consense::Consent.order(id: :asc)
                       .where("responded_at IS NOT NULL")
                       .where(name: @name, user: @user)
    end
  end
end
