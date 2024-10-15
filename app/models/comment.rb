class Comment < ApplicationRecord
  paginates_per 5
  belongs_to :user
  belongs_to :article

  validates :body, presence: true
  def previously_changed?
    previous_changes.empty?
  end
end
