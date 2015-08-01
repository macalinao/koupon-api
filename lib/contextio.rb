class Context

  def contextio
    @contextio ||= ContextIO.new(ENV['CONTEXT_API_KEY'], ENV['CONTEXT_SECRET'])
  end

  def self.i
    @i ||= Context.new
  end

end
