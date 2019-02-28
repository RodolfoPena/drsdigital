class CreateCommitments < ActiveRecord::Migration[5.2]
  def change
    create_table :commitments do |t|
      t.string :action
      t.text :content
      t.date :start_date
      t.date :due_date
      t.references :user, foreign_key: true
      t.references :initiative, foreign_key: true

      t.timestamps
    end
  end
end
