class AddDefaultStatusToTopics < ActiveRecord::Migration[7.0]
  def change
    change_column_default :topics, :status, '0'
  end
end
