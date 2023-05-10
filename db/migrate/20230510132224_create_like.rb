class CreateLike < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.references :posts, null: false, foreign_key: true

      t.timestamps
    end
  end
end
