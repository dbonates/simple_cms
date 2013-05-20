class Section < ActiveRecord::Base
  
  belongs_to :page
  has_many :section_edits
  
  CONTENT_TYPES = ['text', 'HTML']
  validates_presence_of :name
  validates_length_of :name, :maximum => 255
  validates_inclusion_of :content_type, :in => CONTENT_TYPES, :message => "tem que ser: #{CONTENT_TYPES.join(', ')}"
  validates_presence_of :content
  
  scope :visible, where(:visible => true)
  
  attr_accessible :name, :position, :visible, :content_type, :content, :page_id
end
