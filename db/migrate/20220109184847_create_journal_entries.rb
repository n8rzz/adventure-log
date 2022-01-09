class CreateJournalEntries < ActiveRecord::Migration[7.0]
  def change
    create_table :journal_entries do |t|
      t.text :body, null: false
      t.datetime :entry_date, null: false
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
