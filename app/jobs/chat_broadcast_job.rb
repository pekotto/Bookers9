class ChatBroadcastJob < ApplicationJob
  queue_as :default

 def perform(chat)
    ActionCable.server.broadcast "room_channel_#{chat.room_id}", chat: render_chat(chat)
  end

  private

    def render_direct_message(chat)
      ApplicationController.renderer.render : 'chat/user_room_path', locals: { chat: chat }
    end
end
