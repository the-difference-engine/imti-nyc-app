require 'roo'
class Registrant < ApplicationRecord
  has_many :registrant_workshops
  has_many :workshops, through: :registrant_workshops
  belongs_to :local_school, optional: true

  def self.open_spreadsheet(file)
    case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path)
      when ".xls" then Roo::Excel.new(file.path)
      when ".xlsx" then Roo::Excelx.new(file.path)
    else raise "Unknown file type: #{file.original_filename}"
    end
  end

  def self.import(file, workshop_id)
    spreadsheet = open_spreadsheet(file)
    spreadsheet.each do |row|
      registrant = Registrant.create(first_name: row[0], last_name: row[1], email: ActionView::Base.full_sanitizer.sanitize(row[2]), affiliation: row[3], occupation: row[4], phone: row[5])
      RegistrantWorkshop.create(registrant_id: registrant.id, workshop_id: workshop_id)
    end
  end
end
