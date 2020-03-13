class HelpDesk < ApplicationRecord
  belongs_to :organization
  has_many :tickets, dependent: :destroy
end
