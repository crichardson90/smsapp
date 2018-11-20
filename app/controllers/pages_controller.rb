class PagesController < ApplicationController
  
  def index
  
  end

  

  def incoming_sms
    twilio_sid = ENV['TWILIO_SID']
    twilio_token = ENV['TWILIO_TOKEN']
    twilio_phone_number = ENV['TWILIO_PHONE_NUMBER']

    sender_number = params["From"]
    incoming_message = params["Body"]
    message = "Hello from Coty's Macbook."

    @new_message = Message.new
    @new_message.from_number = params["From"]
    @new_message.message_body = params["Body"]
    @new_message.from_city = params["FromCity"]
    @new_message.save

  case incoming_message
    when "Secret"
      message = "You've unlocked a secret!"
    when "Pizza"
      message = "Do you want to order a pizza?"
    else
      message = "This is a boring message"
  end
  # if incoming_message == "Secret"
  #   message = "You've unlocked a secret."
  # else
  #   message = "Boring normal message"
  # end



    @client = Twilio::REST::Client.new(twilio_sid, twilio_token)
    @client.messages.create(
      :from => twilio_phone_number,
      :to => sender_number,
      :body => message
      )

    render :nothing => true
  end
end
