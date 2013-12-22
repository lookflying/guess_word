class CreateJudgeActivities < ActiveRecord::Migration
  def change
    create_table :judge_activities do |t|
      t.references :user, index: true
      t.references :word, index: true

      t.timestamps
    end
  end
end
