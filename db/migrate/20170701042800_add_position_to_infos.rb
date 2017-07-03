class AddPositionToInfos < ActiveRecord::Migration[5.1]
  def change
    add_column :infos, :position, :integer
  end
end
