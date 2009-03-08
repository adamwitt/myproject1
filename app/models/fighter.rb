class Fighter < ActiveRecord::Base
  
  
  
  
  
  
  
############ PAPER CLIP IMAGE UPLOAD STUFF  
  
  # gem sources -a http://gems.github.com
  # gem install thoughtbot-paperclip
  
  # REMEMBER TO UPLOAD: ozfighter/config/initializers => gender_for_paperclip.rb
  # AND ALSO REMEMBER TO UPLOAD: environment.rb (it has a little hack up the top for Paperclip)
  require 'paperclip'
  
  has_attached_file :photo,
                          :styles => { :profile => "300x300", :thumb => "115x115" },
                          :default_url => "/fighters/default_profile_:gender.gif",
                          :path => ":rails_root/public/fighters/:id/:style_:basename.:extension",
                          :url => "/fighters/:id/:style_:basename.:extension"

  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png','image/gif','image/x-png']
  validates_attachment_size :photo, :less_than => 101000

  
  ########### ASSOCIATIONS
  
  has_and_belongs_to_many :rules
  belongs_to :gym
  
  
  
  ########### VALIDATIONS
  
  validates_presence_of :first_name
  validates_presence_of :last_name
  
  validates_numericality_of :wins
  validates_numericality_of :losses
  validates_numericality_of :draws
  validates_numericality_of :kos
  
  validates_presence_of :max_weight
  validates_presence_of :min_weight
  
  validates_presence_of :status
  
  validates_presence_of :gym_id
  
  validates_inclusion_of :gender, :in => ["M","F"]

end
