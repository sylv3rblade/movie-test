class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.integer :score
      t.references :user
      t.references :movie
      t.timestamps
    end
  end
end
