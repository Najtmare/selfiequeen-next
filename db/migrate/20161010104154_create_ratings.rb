class CreateRatings < ActiveRecord::Migration[5.0]
  def change
    create_table :ratings do |t|
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true
      t.float :stars, null: false

      t.timestamps
    end
  end
end
