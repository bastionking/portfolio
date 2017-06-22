class Info < ApplicationRecord
  validates_presence_of :title, :main_image, :thumb_image
end
