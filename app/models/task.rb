  class Task < ActiveRecord::Base
	belongs_to :project

	validates_presence_of :title
	#validate :check_valid_date #if !self.project.nil?

#	private

#	def check_valid_date
#		if(self.due_date < self.project.start_date + 2.months || self.due_date > self.project.end_date)
#			errors.add(:due_date, "is invalid")
#		end
#	end 
#
#	def details
#		"#{self.title} - #{self.project_id}- #{self.due_date} - #{self.is_complete}"
#	end
end
