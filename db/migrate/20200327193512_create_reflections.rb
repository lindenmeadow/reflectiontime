class CreateReflections < ActiveRecord::Migration
  def change
    create_table :reflections do |t|
      t.string :student_name
      t.string :block
      t.string :teacher_name
      t.string :project_name
      t.integer :user_id
    end
  end
end
