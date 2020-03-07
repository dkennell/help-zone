class User < ApplicationRecord
  rolify
  authenticates_with_sorcery!

  has_and_belongs_to_many :organizations

  validates :email, presence: true

  after_create :assign_default_role

  def assign_default_role
    self.add_role(:technician) if self.roles.blank?
  end
end
