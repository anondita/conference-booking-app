class CreateSlotuserrecords < ActiveRecord::Migration[5.2]
  def change
    create_table :slotuserrecords do |t|
      t.string :user_id
      t.string :slot_id

      t.timestamps
    end
  end
end
