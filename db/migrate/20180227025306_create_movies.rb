class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :studio
      t.string :versions, array: true
      t.date :release_date_movie
      t.date :release_date_dvd
      t.integer :status
      t.string :sound
      t.decimal :price
      t.string :rating
      t.string :year
      t.string :genre
      t.string :aspect
      t.string :upc
      t.date :timestamp
      t.boolean :updated
      t.timestamps

      t.index :upc, unique: true
    end
  end
end
