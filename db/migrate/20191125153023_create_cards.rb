class CreateCards < ActiveRecord::Migration[5.2]
  def change
    create_table :cards do |t|
      t.integer :stamp_count, default: 0
      t.integer :state, default: 0
      t.references :place, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
