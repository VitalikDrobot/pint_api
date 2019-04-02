# frozen_string_literal: true

class User < ApplicationRecord
  has_many :pins

  acts_as_votable
end
