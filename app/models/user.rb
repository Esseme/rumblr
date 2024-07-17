class User < ApplicationRecord
  include Clearance::User
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :articles
  has_many :comments

  validates :name, presence: true
end
