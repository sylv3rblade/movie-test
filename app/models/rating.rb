# frozen_string_literal: true

class Rating < ApplicationRecord
  belongs_to :movie
  belongs_to :user
  has_many :comments, as: :commentable

  validates :score, presence: true, numericality: true
  validates_inclusion_of :score, in: 1..10
end
