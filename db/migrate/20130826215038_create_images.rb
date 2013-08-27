class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.string :file
      t.references :attachable, :polymorphic => true

      t.timestamps
    end
    add_index :images, :attachable_id
  end
end
