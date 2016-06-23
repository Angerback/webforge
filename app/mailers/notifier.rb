class Notifier < ApplicationMailer
	default from: "webforge.usach@gmail.com"

	def notify ( receiver, sender, amount )
		@receiver = receiver
		@sender = sender
		@amount = amount
		mail( to: @receiver.email, subject: 'WebForge: Transferencia Bancaria')
	end
	def msgNotify (receiver, chat)
		@receiver = receiver
		@chat = chat
		mail(to: @receiver.email , subject: "WebForge: Nuevo Mensaje en la conversación #{@chat.title}")
	end
end
