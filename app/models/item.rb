class Item < ApplicationRecord

  with_options presence: true do
    validates :text
    validates :price, format: { with: /\A[0-9]+\z/ }
    validates :images
  end

  has_many_attached :images

  validates_inclusion_of :price, in: 1000..5000

  belongs_to :user

end
