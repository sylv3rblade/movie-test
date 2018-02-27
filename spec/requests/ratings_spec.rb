# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Ratings', type: :request do
  let!(:rating) { create(:rating) }

  it 'loads a list of ratings' do
    get '/ratings'
    json = JSON.parse(response.body)
    expect(json.pluck('id')).to include(rating.id)
  end

  it 'loads rating info' do
    get "/ratings/#{rating.id}"
    json = JSON.parse(response.body)
    expect(json['score']).to eql(rating.score)
  end

  describe '.create' do
    let(:user) { create(:user) }
    let(:movie) { create(:movie) }
    let(:created_score) { Faker::Number.between(1, 10) }
    let(:params) do
      { score: created_score, user_id: user.id, movie_id: movie.id }
    end

    it 'creates a rating' do
      post '/ratings', params: { rating: params }
      json = JSON.parse(response.body)
      expect(json['score']).to eql(created_score)
    end
  end

  describe '.update' do
    let!(:rating) { create(:rating, score: 1) }
    let(:new_score) { 2 }
    let(:params) do
      { score: new_score }
    end

    it 'updates rating' do
      put "/ratings/#{rating.id}", params: { rating: params }
      json = JSON.parse(response.body)
      expect(json['score']).to eql(new_score)
    end
  end
end
