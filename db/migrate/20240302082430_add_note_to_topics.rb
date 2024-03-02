class AddNoteToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :note, :text
  end
end
