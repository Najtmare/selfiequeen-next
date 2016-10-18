class CreatePhotos < ActiveRecord::Migration[5.0]
  def change
    create_table :photos do |t|
      t.string :title
      t.string :image
      t.string :height
      t.string :width
      t.references :user, foreign_key: true
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
