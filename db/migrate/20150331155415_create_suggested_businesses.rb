class CreateSuggestedBusinesses < ActiveRecord::Migration
  def change
    create_table :suggested_businesses do |t|
      t.string :requester
      t.string :business_name

      t.timestamps null: false
    end
  end
end
