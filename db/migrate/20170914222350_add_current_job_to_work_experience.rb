class AddCurrentJobToWorkExperience < ActiveRecord::Migration[5.0]
  def change
    add_column :work_experiences, :current_job, :boolean
  end
end
