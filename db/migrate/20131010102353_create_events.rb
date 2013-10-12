class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.integer :rate
      t.datetime :held_at
      t.string :trailer_url

      t.timestamps
    end
  end
end
