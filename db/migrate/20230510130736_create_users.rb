class CreateUsers < ActiveRecord::Migration[7.0]
  def up
    create_table :users do |t|
      t.string :name
      t.string :photo
      t.date :updated_at
      t.date :created_at
      t.string :bio
      t.integer :posts_counter
    end
  end

  def down
    drop_table :users
  end
end
