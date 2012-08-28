class Article < ActiveRecord::Base




attr_accessible :tag_list

   attr_accessible :title, :body
   attr_accessible :image
attr_accessible :title, :body, :tag_list, :image

   has_many :comments
   has_many :taggings
   has_many :tags, :through=> :taggings
   has_attached_file :image
   has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }


   validates :title, :body, :presence=> true
  validates :title, :length=> {:minimum=>2}
  validates :title, :uniqueness=>{:message=>"Already taken"}
 # has_attached_file :image, :styles => { :small => "150x150>" },
                 # :url  => "/assets/articles/:id/:style/:basename.:extension",
                  #:path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

#validates_attachment_presence :image
#validates_attachment_size :image, :less_than => 5.megabytes
#validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png', 'image/jpg']
end
