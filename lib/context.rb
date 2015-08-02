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

  def self.create_user(contextio_token)
    account = api.connect_tokens[contextio_token].account
    exists = User.find_by_contextio_account(account.id)
    exists || User.create({
      name: "#{account.first_name} #{account.last_name}",
      contextio_account: account.id
    })
  end

  def self.api
    @api ||= ContextIO.new(ENV['CONTEXT_API_KEY'], ENV['CONTEXT_SECRET'])
  end

end
