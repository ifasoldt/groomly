class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :ticket
  validates :user_id, uniqueness: { scope: :ticket_id, message: "only one vote per ticket" }
end
