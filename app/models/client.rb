class Client < ActiveRecord::Base
    
	has_many :projects
	belongs_to :user 
	before_create :generate_client_code 
	validates_presence_of :name, :company, :mobile, :email
	validates_length_of :mobile, is: 10
	validates_numericality_of :mobile
	#validates_format_of :email, :with =>/\A([^@\s]+)@((?;[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates_uniqueness_of :mobile, :email
	
	def details 
		"#{self.name} - #{self.company}- #{self.mobile} - #{self.email}"
	end 
	def list_projects
		Project.where('client_id = ?', self.id)
	end 
	def list_by_status(status)
		Project.where('client_id = ? AND status = ?', self.id, status)
	end 
	def generate_client_code
		self.code="#{self.name[0..2]}- #{Client.last.nil? ? 1 : Client.last.id + 1}"
	end 
end
