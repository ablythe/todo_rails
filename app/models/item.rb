class Item < ActiveRecord::Base
  belongs_to :user
  belongs_to :list

  validates :user, presence: true
  validates :list, presence: true

  validates :description, presence: true

  def self.package_date item_params
    date = DateTime.new(
      item_params["due_date(1i)"].to_i,
      item_params["due_date(2i)"].to_i, 
      item_params["due_date(3i)"].to_i
    )
  end
end
