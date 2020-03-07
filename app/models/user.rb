class User < ApplicationRecord
  rolify
  authenticates_with_sorcery!

  validates :email, presence: true
end
