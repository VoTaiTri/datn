class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string :name
      t.references :department, index: true

      t.timestamps null: false
    end
    add_foreign_key :subjects, :departments
  end
end
