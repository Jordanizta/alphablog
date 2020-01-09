class ChangeCollumnNameMoodToLike < ActiveRecord::Migration[5.2]
  def change
    rename_column :reactions, :mood, :like 
  end
end
