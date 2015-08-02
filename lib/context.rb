class Context
  def self.parts_from_message(message)
    {
      subject: message.subject,
      from: message.addresses['from'],
      body: message.body_parts.where(type: 'text/plain').first.content
    }
  end

  def self.api
    @api ||= ContextIO.new(ENV['CONTEXT_API_KEY'], ENV['CONTEXT_SECRET'])
  end
end
