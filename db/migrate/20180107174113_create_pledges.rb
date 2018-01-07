class CreatePledges < ActiveRecord::Migration[5.1]
  def change
    create_table :pledges do |t|
        t.integer :user_id
        t.float :dollar_amount
        t.bigint :project_id
      t.timestamps
    end
  end
end
