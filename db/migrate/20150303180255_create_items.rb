class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :description
      t.belongs_to :user, index: true
      t.belongs_to :list, index: true
      t.datetime :due_date
      t.boolean :status, default: false

      t.timestamps null: false
    end
    # add_foreign_key :items, :users
    add_foreign_key :items, :lists
  end
end
