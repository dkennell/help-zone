class Ticket < ApplicationRecord
  validates :email, presence: true
  validates :title, presence: true
  validates :body, presence: true

  has_many :comments, dependent: :destroy
  belongs_to :help_desk
end
