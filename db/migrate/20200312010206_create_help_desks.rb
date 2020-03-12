class CreateHelpDesks < ActiveRecord::Migration[5.2]
  def change
    create_table :help_desks do |t|
      t.text :name
      t.references :organization

      t.timestamps
    end
  end
end
