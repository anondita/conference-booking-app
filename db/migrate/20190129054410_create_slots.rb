class CreateSlots < ActiveRecord::Migration[5.2]
  def change
    create_table :slots do |t|
      t.string :room_id
      t.time :starttime
      t.time :endtime
      t.date :dateofslot
      t.string :name

      t.timestamps
    end
  end
end
