class Notifier < ApplicationMailer
	default from: "webforge.usach@gmail.com"

	def notify ( receiver, sender, amount )
		@receiver = receiver
		@sender = sender
		@amount = amount
		mail( to: @receiver.email, subject: 'WebForge: Transferencia Bancaria')
	end
	def msgNotify (receiver,sender)
		@receiver = receiver
		@sender = sender
		mail(to: @receiver.email, subject: "WebForge: Nuevo Mensaje de #{@sender.name}")
	end
end
