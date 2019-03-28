# frozen_string_literal: true

class User < ApplicationRecord
  has_many :pins
  
  has_secure_password
end
