class CreateRedirects < ActiveRecord::Migration[6.0]
  def change
    create_table :redirects do |t|
      t.string :from
      t.string :to
      t.boolean :active

      t.timestamps
    end
  end
end
