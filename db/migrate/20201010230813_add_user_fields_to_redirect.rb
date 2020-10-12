class AddUserFieldsToRedirect < ActiveRecord::Migration[6.0]
  def change
    add_reference :redirects, :user, foreign_key: true
  end
end
