class CreateJoinTableUsrProjectReward < ActiveRecord::Migration[5.1]
  def change
    create_table :claims do |t|
      t.integer :user_id, null: false
      t.integer :project_id, null:false
      t.integer :reward_id, null: false
      t.timestamps
    end
  end
end
