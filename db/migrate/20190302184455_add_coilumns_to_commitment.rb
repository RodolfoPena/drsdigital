class AddCoilumnsToCommitment < ActiveRecord::Migration[5.2]
  def change
    add_column :commitments, :deliverable, :boolean
    add_column :commitments, :critical, :boolean
  end
end
