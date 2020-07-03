class Organization < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :help_desks, dependent: :destroy
  has_many :tickets, through: :help_desks

  validates :name, presence: true

  resourcify
end
