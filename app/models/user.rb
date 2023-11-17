class User < ApplicationRecord
  include Clearance::User

  has_many :articles

  def user_name
    email.gsub(/@.*$/, "")
  end
end
