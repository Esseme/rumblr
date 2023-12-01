class User < ApplicationRecord
  include Clearance::User

  has_many :articles

  validates :name, presence: true
end
