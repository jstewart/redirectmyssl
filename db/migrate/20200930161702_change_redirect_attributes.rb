class ChangeRedirectAttributes < ActiveRecord::Migration[6.0]
  def change
    rename_column :redirects, :to, :destination
    remove_column :redirects, :from
  end
end
