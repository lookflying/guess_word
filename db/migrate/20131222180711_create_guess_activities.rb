class CreateGuessActivities < ActiveRecord::Migration
  def change
    create_table :guess_activities do |t|
      t.datetime :time
      t.integer :user_id
      t.integer :word_id
      t.string :status

      t.timestamps
    end
  end
end
