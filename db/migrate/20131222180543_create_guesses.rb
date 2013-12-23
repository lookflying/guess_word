class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.datetime :time
      t.integer :user_id
      t.integer :word_id
      t.string :content

      t.timestamps
    end
  end
end
