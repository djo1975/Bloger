class CreateComment < ActiveRecord::Migration[7.0]
  def change
    create_table :comment do |t|
      t.text :text

      t.timestamps
    end
  end
end
