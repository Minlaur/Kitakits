  # This migration creates the messages table with the following columns:
  # - content: text
  # - booking_id: bigint
  # - user_id: bigint

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.references :booking, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
