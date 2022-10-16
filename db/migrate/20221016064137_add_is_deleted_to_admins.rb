class AddIsDeletedToAdmins < ActiveRecord::Migration[6.1]
  def change
    add_column :admins, :is_deleted, :boolean, default: false
  end
end
