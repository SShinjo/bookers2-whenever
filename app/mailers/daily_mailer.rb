class DailyMailer < ApplicationMailer
	def send_mails
		mail bcc: User.pluck(:email), subject: "こんちは〜"
	end
end
