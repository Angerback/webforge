class Notifier < ApplicationMailer
	default from: "webforge.usach@gmail.com"

	def notify ( receiver, sender, amount )
		@receiver = receiver
		@sender = sender
		@amount = amount
		mail( to: @receiver.email, subject: 'WebForge: Transferencia Bancaria')
	end
	
	def msgNotify (emails, chat, body)
		
		@body = body
		@chat = chat
		mail(to: emails , subject: "WebForge: Nuevo Mensaje en el chat: #{@chat}", "Access-Control-Allow-Origin" => true)		
	end

	def commentNotify(emails, theme, content)
		@theme = theme
		@content = content
		mail(to: emails, subject: "WebForge: nuevo mensaje en el foro: #{@theme.title}", "Access-Control-Allow-Origin" => true)
	end
end
