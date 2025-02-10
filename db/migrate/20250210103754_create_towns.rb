class CreateTowns < ActiveRecord::Migration[8.0]
  def change
    create_table :towns do |t|
      t.string :name
      t.references :county, null: false, foreign_key: true

      t.timestamps
    end
  end
end
