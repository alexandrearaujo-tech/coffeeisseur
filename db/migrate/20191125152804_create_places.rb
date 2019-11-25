class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.string :street
      t.string :city
      t.string :photo
      t.decimal :average_rating, default: 0

      t.timestamps
    end
  end
end
