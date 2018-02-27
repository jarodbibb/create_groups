class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.integer :count
      t.string :name
      t.string :created_by
      t.string :description
      t.references :members, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
