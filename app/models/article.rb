class Article < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :content, presence: true

  def previously_changed?
    previous_changes.empty?
  end
end
