class AddAccTypeFromAccesory < ActiveRecord::Migration[5.0]
  def change
    add_column :accesories, :acc_type, :string
  end
end
