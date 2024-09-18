class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :article

  validates :body, presence: true
  def previously_changed?
    previous_changes.empty?
  end
end
