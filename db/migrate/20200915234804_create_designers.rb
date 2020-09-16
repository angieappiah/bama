class CreateDesigners < ActiveRecord::Migration[6.0]
  def change
    create_table :designers do |t|
      t.string :username
      t.string :email
      t.string :location
      t.string :phone
      t.string :password_digest

      t.timestamps
    end
  end
end
