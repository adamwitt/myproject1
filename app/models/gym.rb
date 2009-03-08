class Gym < ActiveRecord::Base
  
  
  ############ PAPER CLIP IMAGE UPLOAD STUFF  
  
  # gem sources -a http://gems.github.com
  # gem install thoughtbot-paperclip
  
  # REMEMBER TO UPLOAD: ozfighter/config/initializers => gender_for_paperclip.rb
  # AND ALSO REMEMBER TO UPLOAD: environment.rb (it has a little hack up the top for Paperclip)
  require 'paperclip'
  
  has_attached_file :photo,
                          :styles => { :thumb => "115x115" },
                          :default_url => "/gyms/default_gym_profile.gif",
                          :path => ":rails_root/public/gyms/:id/:style_:basename.:extension",
                          :url => "/gyms/:id/:style_:basename.:extension"

#  validates_attachment_content_type :photo, :content_type => ['image/jpeg','image/png','image/gif','image/x-png']
 # validates_attachment_size :photo, :less_than => 101000

  
###### ASSOCIATIONS  
  has_many :fighters
  
  
###### VALIDATIONS

  # Gym Details
  validates_presence_of :name, :message => "- Gym Name can't be blank"
  validates_presence_of :first_name, :message => "- Please enter your first name"
  validates_presence_of :last_name, :message => "- Please enter your last name"

  # Login details
  validates_presence_of :login_id, :message => "ID - You must enter a Login ID, this will be used for when you want to log into your account!"
  validates_uniqueness_of :login_id, :message => "ID - That Login ID is already in use. Please choose a different Login ID."

  validates_presence_of :password, :message => "- Please enter in a password"
  validates_length_of :password, :minimum => 6
  validates_format_of :password, :with => /\w/, :message => "- Please enter a valid password with no whitespace or special characters."
  
  # Secret Q&A
  validates_presence_of :secret_question, :message => "- Secret Question can't be blank"
  validates_presence_of :secret_answer, :message => "- Please enter an answer to your secret question."
  
  # Contact details
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message => "- Please enter a valid email address."
  validates_uniqueness_of :email, :message => "- That email is already in use. Please choose a different email."
  validates_presence_of :primary_contact_number, :message => "- Please enter a primary contact number"
  validates_presence_of :email, :message => "- Please enter an email address"
  validates_presence_of :state, :message => "- Please enter the state of Australia your gym is located in"
  validates_presence_of :city, :message => "- Please enter which town or city your gym is located in"
  validates_presence_of :address_line_1, :message => "- Please enter the address of your gym"
  

  

end
