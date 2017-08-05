class RemoveTypeFromAccesory < ActiveRecord::Migration[5.0]
  def change
    remove_column :accesories, :type, :string
  end
end
