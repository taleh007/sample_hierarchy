class ChangeNameOnSitePoints < ActiveRecord::Migration[6.0]
  def change
    change_column :site_points, :name, :string, null: false
  end
end
