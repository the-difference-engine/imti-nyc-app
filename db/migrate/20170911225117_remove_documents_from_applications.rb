class RemoveDocumentsFromApplications < ActiveRecord::Migration[5.0]
  def change
    remove_column :applications, :resume, :string
    remove_column :applications, :health_form, :string
    remove_column :applications, :personal_essay, :text

  end
end
