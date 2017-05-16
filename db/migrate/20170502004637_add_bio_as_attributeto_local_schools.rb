kclass AddBioAsAttributetoLocalSchools < ActiveRecord::Migration[5.0]
  def change
    add_column :local_schools, :bio, :text
  end
end
