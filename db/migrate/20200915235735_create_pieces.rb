class CreatePieces < ActiveRecord::Migration[6.0]
  def change
    create_table :pieces do |t|
      t.string :medium
      t.string :image
      t.string :size
      t.text :comment
      t.integer :designer_id
      t.integer :style_id


      t.timestamps
    end
  end
end
