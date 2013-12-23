class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :word
      t.string :property
      t.integer :count

      t.timestamps
    end
  end
end
