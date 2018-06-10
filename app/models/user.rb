# frozen_string_literal: true

class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader
end
