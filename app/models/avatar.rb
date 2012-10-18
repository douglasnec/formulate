class Avatar < ActiveRecord::Base
  has_many :accounts
  attr_accessible :flag, :image
  
  has_attached_file :image, :style => {:medium => "300x300#", :thumb => "100x100"}
  validates_attachment_presence :image
  validates_attachment_size     :image, :less_than => 2.megabyte
  validates_attachment_content_type :image, :content_type => %w(image/png image/jpeg image/gif)
end
