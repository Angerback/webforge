require 'rails_helper'

RSpec.describe Message, type: :model do
	it "Es válido con body, user_id y chat_id" do
		message = Message.new(
			body: "<p>Hello world</p>",
			user_id: 1,
			chat_id: 1)
		expect(message).to be_valid 
	end

	it "Es válido sin body" do
		message = Message.new(body: nil)
		message.valid?
		expect(message.errors[:body]).to include("no puede estar en blanco")
	end

	it "Es válido sin user_id" do
		message = Message.new(user_id: nil)
		message.valid?
		expect(message.errors[:user_id]).to include("no puede estar en blanco")
	end

	it "Es válido sin chat_id" do
		message = Message.new(chat_id: nil)
		message.valid?
		expect(message.errors[:chat_id]).to include("no puede estar en blanco")
	end
end