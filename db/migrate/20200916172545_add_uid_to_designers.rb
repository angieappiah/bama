class AddUidToDesigners < ActiveRecord::Migration[6.0]
  def change
    add_column :designers, :uid, :string
  end
end
