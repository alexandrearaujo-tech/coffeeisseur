class CreateExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :experiences do |t|
      t.string :name
      t.text :description
      t.string :photo
      t.decimal :average_rating, default: 0
      t.string :qr_code
      t.references :category, foreign_key: true
      t.references :place, foreign_key: true

      t.timestamps
    end
  end
end
