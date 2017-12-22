module Consense
  class Consent < ActiveRecord::Base
    belongs_to :user

    STATUSES = {
      undetermined: 0,
      approved: 1,
      denied: 2
    }.freeze

    STATUSES.each do |status, number|
      define_method("#{status}?") { self[:status] == number }
      scope status, -> { where(status: number)}
    end

    def status
      STATUSES.key(self[:status])
    end

    def approve!
      respond! "approved"
    end

    def deny!
      respond! "denied"
    end

    private

    def respond!(new_status)
      return if new_status == "undetermined"
      return if responded_at.present?
      self.status = STATUSES[new_status.to_sym]
      self.responded_at = Date.current
      self.save!
    end
  end
end
