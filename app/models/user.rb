class User < ApplicationRecord
  include Clearance::User
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :articles

  validates :name, presence: true
end
