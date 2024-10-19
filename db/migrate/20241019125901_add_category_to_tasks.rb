class AddCategoryToTasks < ActiveRecord::Migration[6.0]
  def change
    add_reference :tasks, :category, foreign_key: true, null: true # Change null: false to null: true
  end
end
