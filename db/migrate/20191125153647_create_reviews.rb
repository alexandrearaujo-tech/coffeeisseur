class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :rating, default: 0
      t.references :booking, foreign_key: true
      t.references :compliment, foreign_key: true

      t.timestamps
    end
  end
end
