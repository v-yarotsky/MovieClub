class RenameHeldAtToScheduledForOnEvents < ActiveRecord::Migration
  def change
    rename_column :events, :held_at, :scheduled_for
  end
end
