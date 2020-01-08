class AddMoodToReaction < ActiveRecord::Migration[5.2]
  def change
    add_column :reactions, :mood, :boolean, default: true
  end
end
