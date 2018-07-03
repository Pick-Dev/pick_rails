# frozen_string_literal: true

class User < ApplicationRecord
  has_many :photos, -> { order(created_at: :desc) }
  mount_uploader :avatar, ImageUploader
end
