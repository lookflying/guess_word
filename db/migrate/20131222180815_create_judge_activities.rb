class CreateJudgeActivities < ActiveRecord::Migration
  def change
    create_table :judge_activities do |t|
      t.datetime :time
      t.integer :user_id
      t.integer :word_id

      t.timestamps
    end
  end
end
