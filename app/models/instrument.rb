class Instrument < ApplicationRecord
  # mount_uploader :image, ImageUploader

  belongs_to :type

  has_one :lesson, dependent: :delete

  # Validation
  validates :name, :price, presence: true
  validates :price, numericality: true

  # Active Storage
  has_one_attached :image

  ## Uploaded Images on resize
  def image_as_thumbnail
    image.variant(resize_to_fit: [150, nil])
  end

  def image_pagination_display
    image.variant(resize_to_fit: [500, nil])
  end

  def image_detail_display
    image.variant(resize_to_fit: [600, nil])
  end

  def image_active_admin_display
    image.variant(resize_to_fit: [300, nil])
  end
end
