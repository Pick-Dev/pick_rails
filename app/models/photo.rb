# frozen_string_literal: true

class Photo < ApplicationRecord
  
  belongs_to :user
  mount_uploader :image, ImageUploader

end
