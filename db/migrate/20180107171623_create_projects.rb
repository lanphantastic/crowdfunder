class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
        t.string :title
        t.text :description
        t.integer :goal
        t.datetime :start_date
        t.datetime :end_date
        t.string :image
        t.integer :user_id
        t.integer :category_id
      t.timestamps
    end
  end
end
