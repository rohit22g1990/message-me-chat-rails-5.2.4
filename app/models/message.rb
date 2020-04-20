class Message < ApplicationRecord
    validates :message, presence: true
    belongs_to :user
    scope :custom_messages, -> { order(:id).last(3) }
end
