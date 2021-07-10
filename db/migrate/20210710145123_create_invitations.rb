class CreateInvitations < ActiveRecord::Migration[6.1]
  def change
    create_table :invitations, id: false do |t|
      t.bigint :event_id
      t.bigint :attendee_id

      t.timestamps
    end

    add_index :invitations, :event_id
    add_index :invitations, :attendee_id
  end
end
