class Attendance < ApplicationRecord
belongs_to :user
belongs_to :event

after_create :send_email_to_creator
def send_email_to_creator
  CreatorMailer.send_mail_creator(self).deliver_now
end

end
