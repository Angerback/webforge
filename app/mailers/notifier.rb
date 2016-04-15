class Notifier < ApplicationMailer
	default from: "webforge.usach@gmail.com"

	def notify ( receiver, sender, amount )
		@receiver = receiver
		@sender = sender
		@amount = amount
		mail( to: @receiver.email, subject: 'WebForge: Transferencia Bancaria')
	end
end
