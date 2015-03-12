class CreateTeachings < ActiveRecord::Migration
  def change
    create_table :teachings do |t|
      t.references :lecturer, index: true
      t.references :subject, index: true

      t.timestamps null: false
    end
    add_foreign_key :teachings, :lecturers
    add_foreign_key :teachings, :subjects
  end
end
