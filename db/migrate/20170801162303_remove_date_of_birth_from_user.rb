class RemoveDateOfBirthFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :date_of_birth, :date
  end
end
