class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.references :users, index: true, foreign_key: true
      t.references :groups, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
