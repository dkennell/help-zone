class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :title
      t.text :body
      t.references :help_desk, foreign_key: true

      t.timestamps
    end
  end
end
