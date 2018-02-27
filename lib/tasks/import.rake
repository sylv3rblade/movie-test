# frozen_string_literal: true

require 'csv'

namespace :import do
  desc 'simple task for importing movies'
  task movies: :environment do

    puts 'Importing Movies'

    CSV.foreach('tmp/recent_movies.csv', headers: true) do |row|
      movie = Movie.find_or_initialize_by(upc: row['UPC'])
      # still investigating why DVD_Title returns nil
      movie.update_attributes!(
        title: row[0], # for some reason the 'DVD_Title' doesn't work
        studio: row['Studio'],
        status: row['Status'],
        sound: row['Sound'],
        versions: row['Versions'].split(','),
        price: row['Price'].gsub('$', ''),
        rating: row['Rating'],
        year: row['Year'],
        genre: row['Genre'],
        aspect: row['Aspect'],
        release_date_movie: date_parser(row['Released']),
        release_date_dvd: date_parser(row['DVD_ReleaseDate']),
        timestamp: date_parser(row['Timestamp']),
        updated: row['Updated']
      )
    end
  end

  def date_parser(date_string)
    return nil if date_string.blank?
    month, date, year = date_string.split('/')
    year = year.prepend('20') if year.length <= 2
    [month, date, year].join('/')
  end
end
