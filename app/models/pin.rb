# frozen_string_literal: true

class Pin < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
end
