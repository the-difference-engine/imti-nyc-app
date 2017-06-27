class Document < ApplicationRecord
  belongs_to :application

  has_attached_file :attachment
  # , PAPERCLIP_STORAGE_OPTIONS 
  validates_attachment :attachment, content_type: { content_type: ['application/pdf', 'application/msword', 'application/xml', /\Aapplication\/vnd.openxmlformats-.*/, 'image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }
  validates :attachment_file_name, presence: true

  validates :category, inclusion: { in: ['health_form', 'personal_essay', 'recommendation', 'resume', 'toefl_ielts_score_report', 'transcript', 'wes_evaluation', 'contract', 'student_visa', 'passport_photo'] }

  validates :attachment_file_size, numericality: { greater_than: 0 }
end
