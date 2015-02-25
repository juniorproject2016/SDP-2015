class CreateBusinessCategories < ActiveRecord::Migration
  def change
    create_table :business_categories do |t|
      t.string :business_id
      t.string :category_id

      t.timestamps
    end
  end
end
