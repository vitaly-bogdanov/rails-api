class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def validate_image
    if image.attached?
      errors.add(:image, 'Изображение должно иметь формат jpeg или jpg') unless image.content_type.in?(%w(image/jpeg image/jpg))
    end
  end
end
