# frozen_string_literal: true

class Movie < ApplicationRecord
  has_many :ratings

  enum status: %w[Pending Out Discontinued]

  validates :title, :studio, presence: true
end
