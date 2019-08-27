class CreateDrinks < ActiveRecord::Migration[6.0]
  def change
    create_table :drinks do |t|
      t.string :name
      t.string :body
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
