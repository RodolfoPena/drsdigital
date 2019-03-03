class AddStageToCommitment < ActiveRecord::Migration[5.2]
  def change
    add_column :commitments, :stage, :integer
  end
end
