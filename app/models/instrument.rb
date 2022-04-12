class Instrument < ApplicationRecord
  belongs_to :type

  has_one :lesson, dependent: :delete

  # Validation
  validates :name, :price, presence: true
  validates :price, numericality: true

  # Active Storage
  has_one_attached :image

  ## Uploaded Images on resize
  def image_as_thumbnail
    image.variant(resize_to_limit: [150, nil])
  end

  def image_pagination_display
    image.variant(resize_to_limit: [400, nil])
  end

  def image_detail_display
    image.variant(resize_to_limit: [600, nil])
  end

  def image_active_admin_display
    image.variant(resize_to_limit: [300, nil])
  end
end
