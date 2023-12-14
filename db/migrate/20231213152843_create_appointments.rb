class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.date :scheduled_on
      t.string :user_id, null: false

      t.timestamps
    end
    add_index :appointments, :user_id
  end
end