class ProxyConfig
  attr_accessor :ip, :port
  def ip_port
    "#{@ip}:#{@port}"
  end
end
