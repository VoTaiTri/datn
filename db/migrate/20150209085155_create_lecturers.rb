class CreateLecturers < ActiveRecord::Migration
  def change
    create_table :lecturers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :remember_digest
      t.string :avatar
      t.boolean :admin, default: false
      t.references :department, index: true

      t.timestamps null: false
    end
    add_index :lecturers, :email, unique: true
    add_foreign_key :lecturers, :departments
  end
end