class CreateSitePoints < ActiveRecord::Migration[6.0]
  def change
    create_table :site_points do |t|
      t.string :name
      t.string :path

      t.timestamps
    end
  end
end
