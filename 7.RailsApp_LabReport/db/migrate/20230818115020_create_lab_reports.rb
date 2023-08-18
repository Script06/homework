class CreateLabReports < ActiveRecord::Migration[7.1]
  def change
    create_table :lab_reports do |t|
      t.string :title, limit: 250, null: false
      t.text :description, limit: 500
      t.string :grade, limit: 2
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
