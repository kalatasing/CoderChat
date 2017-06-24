class CreateMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :messages do |t|
      t.string :title
      t.text :body
      t.integer :sender_id
      t.integer :recipient_id
      t.boolean :read_status
      t.datetime :read_at

      t.timestamps
    end
  end
end
