class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.datetime :time
      t.integer :user_id
      t.integer :word_id
      t.string :content
      t.integer :judge_id
      t.string :judge

      t.timestamps
    end
  end
end
