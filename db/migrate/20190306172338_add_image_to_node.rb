class AddImageToNode < ActiveRecord::Migration[5.2]
  def change
    add_column :nodes, :image, :string
  end
end
