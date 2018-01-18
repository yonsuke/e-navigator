class CreateInterviews < ActiveRecord::Migration[5.1]
  def change
    create_table :interviews do |t|
      t.datetime :start_time, null: false
      t.integer :status, default: 0, null: false, limit: 2
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
