class AddColumnsToCommitment < ActiveRecord::Migration[5.2]
  def change
    add_column :commitments, :renegotiation_date, :date
    add_column :commitments, :closing_date, :date
  end
end
