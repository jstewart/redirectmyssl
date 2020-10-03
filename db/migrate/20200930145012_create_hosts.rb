class CreateHosts < ActiveRecord::Migration[6.0]
  def change
    create_table :hosts do |t|
      t.string :hostname, null: false
      t.references :redirect, null: false, foreign_key: true

      t.timestamps
    end
  end
end
