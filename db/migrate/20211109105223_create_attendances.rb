class CreateAttendances < ActiveRecord::Migration[6.1]
  def change
    create_table :attendances do |t|
      t.datetime :clock_in_at
      t.datetime :clock_out_at
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :attendances, [:user_id, :created_at]
  end
end
