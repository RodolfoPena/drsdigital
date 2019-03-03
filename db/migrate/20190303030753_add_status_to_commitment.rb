class AddStatusToCommitment < ActiveRecord::Migration[5.2]
  def change
    add_column :commitments, :status, :integer
  end
end
