class Context

  def self.parse_inbox(account)
    account.messages.map { |message| parts_from_message(message) }
  end

  def self.parts_from_message(message)
    {
      subject: message.subject,
      from: message.addresses['from'],
      body: message.body_parts.where(type: 'text/plain').first.content
    }
  end

  def self.auth_url
    api.connect_tokens.create(CONTEXT_CALLBACK_URL).browser_redirect_url
  end

  def self.api
    @api ||= ContextIO.new(ENV['CONTEXT_API_KEY'], ENV['CONTEXT_SECRET'])
  end
end
