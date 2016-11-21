module ConversationsHelper

  def conversation_user(user, message)
    if message.user == user
      content_tag(:div, message.content, class: "conversation-current-user" )
    else
      content_tag(:div, message.content, class: "conversation-sender")
    end
  end
end
