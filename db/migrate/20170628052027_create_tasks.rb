class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
    	t.string :title, :null => false
    	t.string :status, :null => false, :default => "new"
    	t.text :description
    	t.integer :rating
    	t.integer :reporter_id, :null => false
    	t.integer :assigned_to
    	t.integer :assigned_by

      t.timestamps
    end

    add_index :tasks, :reporter_id
  end
end
