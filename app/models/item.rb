class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :user, presence: true
  validates :list, presence: true

  validates :description, presence: true
end
