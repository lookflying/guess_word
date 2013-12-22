class CreateGuessActivities < ActiveRecord::Migration
  def change
    create_table :guess_activities do |t|
      t.references :user, index: true
      t.references :word, index: true

      t.timestamps
    end
  end
end
