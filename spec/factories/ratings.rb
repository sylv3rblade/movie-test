# frozen_string_literal: true

FactoryBot.define do
  factory :rating do
    movie
    user
    score { (0..10).to_a.sample }
  end
end
