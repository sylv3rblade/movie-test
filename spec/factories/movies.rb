# frozen_string_literal: true

FactoryBot.define do
  factory :movie do
    title { Faker::Name.name }
    studio { Faker::Name.name }
    versions { [%w[LBX 16:9 BLU-RAY].sample] }
    sound { %w[2 5.1 SIL DTS].sample }
    rating 'NR'
    genre { %w[Sports Family Horror].sample }
    upc { Faker::Number.digit }
  end
end
