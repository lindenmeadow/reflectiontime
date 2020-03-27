class CreateReflections < ActiveRecord::Migration
  def change
    create_table :reflections do |t|
      t.string :student_name
      t.string :block
      t.string :teacher_name
      t.string :project_name
      t.string :project_type
      t.string :conduct
      t.string :leadership
      t.string :work
      t.string :creativity
      t.string :collaboration
      t.string :thinking
      t.string :communication
      t.text :comments
      t.integer :user_id
    end
  end
end
