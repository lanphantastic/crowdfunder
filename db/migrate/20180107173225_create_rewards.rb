class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
        t.integer :project_id
        t.string :description
        t.float :dollar_amount
        
      t.timestamps
    end
  end
end
