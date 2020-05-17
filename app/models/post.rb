class Post < ApplicationRecord
  has_one_attached :image, :dependent => :purge_later
  validates :title, 
    presence: true, 
    length: { 
      minimum: 5, 
      maximum: 15
    }

  validates :description, 
    presence: true, 
    length: { 
      minimum: 5, 
      maximum: 100
    }
  
  validates :body, 
    presence: true, 
    length: { 
      minimum: 5, 
      maximum: 150
    }

  validate :validate_image

  def large_image
    if image.attached?
      image.variant(resize: '540x426!').processed
    end
  end

  def middle_image
    if image.attached?
      image.variant(resize: '270x213!').processed
    end
  end

  def thumb_image
    if image.attached?
      image.variant(resize: '135x107!').processed
    end
  end
end
