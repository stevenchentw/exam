class AddUseridToMassage < ActiveRecord::Migration
  def change
      add_column :massages, :user_id, :integer
      add_column :users, :massage_id, :integer

  end
end

