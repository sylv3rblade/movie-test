# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Movies', type: :request do
  let!(:movie) { create(:movie) }

  it 'loads a list of movies' do
    get '/movies'
    json = JSON.parse(response.body)
    expect(json.pluck('id')).to include(movie.id)
  end

  it 'loads movie info' do
    get "/movies/#{movie.id}"
    json = JSON.parse(response.body)
    expect(json['title']).to eql(movie.title)
  end
end
