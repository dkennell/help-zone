class Ticket < ApplicationRecord
  validates :email, presence: true
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :help_desk
end
