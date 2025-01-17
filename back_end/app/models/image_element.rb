class ImageElement < ApplicationRecord
    belongs_to :user
    belongs_to :comic
    has_one_attached :image
    
    validate :acceptable_image

    def acceptable_image
      return unless image.attached?

      unless image.byte_size <= 1.megabyte
        errors.add(:main_image, "is too big")
    end

    acceptable = ["image/jpeg", "image/png"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:image, "must be a JPEG or PNG")




end
