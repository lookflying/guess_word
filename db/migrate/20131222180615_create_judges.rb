class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.datetime :time
      t.integer :user_id
      t.integer :guess_id
      t.string :judge

      t.timestamps
    end
  end
end
