class Book < ActiveRecord::Base

  extend FriendlyId
    friendly_id :name, use: :slugged

  belongs_to :user
  has_attached_file :image
  has_attached_file :resource

  # so won't get validation error when upload
  validates_attachment_content_type :image,
  content_type:  /^image\/(png|gif|jpeg)/,
  message: "Only images allowed"

  validates_attachment_content_type :resource,
  content_type: ['application/pdf'],
  message: "Only pdfs allowed"

  validates :image, attachment_presence: true
  validates :resource, attachment_presence: true

 	has_many :sales

end
