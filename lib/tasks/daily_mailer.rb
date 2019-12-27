require "#{Rails.root}/app/mailers/daily_mailer"

class Tasks::DailyMailer
	def self.send_mails
		DailyMailer.send_mails.deliver
	end
end