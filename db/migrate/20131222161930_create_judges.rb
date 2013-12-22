class CreateJudges < ActiveRecord::Migration
  def change
    create_table :judges do |t|
      t.datetime :time
      t.references :user, index: true
      t.references :guess, index: true
      t.string :judge

      t.timestamps
    end
  end
end
