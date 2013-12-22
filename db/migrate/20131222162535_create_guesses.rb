class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.datetime :time
      t.references :user, index: true
      t.references :word, index: true
      t.string :content

      t.timestamps
    end
  end
end
