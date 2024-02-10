class DropTableLanguageAndNoationality < ActiveRecord::Migration[7.0]
  def change
    drop_table :languages
    drop_table :nationalities
  end
end
