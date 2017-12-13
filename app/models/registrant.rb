require 'roo'
class Registrant < ApplicationRecord
  has_many :registrant_workshops
  belongs_to :workshops
  has_many :charges
  belongs_to :local_school, optional: true
  validates :email, :first_name, :last_name, presence: true

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
    end
  end

  def self.import(file, workshop_id, local_school_id)
    if file == nil
      return "Please select file"
    end
    spreadsheet = open_spreadsheet(file)
    if spreadsheet == nil
      return "Invalid File"
    else
      spreadsheet.each_with_index do |row, index|
        next if index.zero?
        registrant = Registrant.create(first_name: row[0], last_name: row[1], email: ActionView::Base.full_sanitizer.sanitize(row[2]), affiliation: row[3], occupation: row[4], phone: row[5], local_school_id: local_school_id)
        RegistrantWorkshop.create(registrant_id: registrant.id, workshop_id: workshop_id)
      end
      return "success"
    end
  end
end
