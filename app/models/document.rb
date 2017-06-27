class Document < ApplicationRecord
  belongs_to :application

  has_attached_file :attachment, PAPERCLIP_STORAGE_OPTIONS 
  validates_attachment :attachment, content_type: { content_type: ['application/pdf', 'application/msword', 'application/xml', /\Aapplication\/vnd.openxmlformats-.*/, 'image/jpg', 'image/jpeg', 'image/png', 'image/gif'] }
  validates :attachment_file_name, presence: true
  validates_uniqueness_of :category, scope:[:application_id]

end
