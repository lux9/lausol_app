class AddFnameToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :fname, :string
  end
end
