class CreateSponsorships < ActiveRecord::Migration[5.0]
  def change
    create_table :sponsorships do |t|
      t.references :conference, foreign_key: true
      t.references :Sponsor, foreign_key: true
      t.string :status
      t.integer :category
      t.float :amount
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
