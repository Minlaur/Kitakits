class RemoveTagFromTopics < ActiveRecord::Migration[7.0]
  def change
    remove_column :topics, :tag_id
  end
end
