require 'telegram/bot'

token = '8050645588:AAHYDWER1JKs2G5-5eat5XsMpN86avOEggo'

Telegram::Bot::Client.run(token) do |bot|
  bot.listen do |message|
    
    next unless message.is_a?(Telegram::Bot::Types::Message) && message.text
    
    case message.text
    when '/start'
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Привіт, #{message.from.first_name}! Я твій перший Ехо-бот на Ruby!"
      )
    else 
      bot.api.send_message(
        chat_id: message.chat.id,
        text: "Я отримав від тебе: #{message.text}"
      )
    end
  end
end