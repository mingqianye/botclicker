class ProxyConfig
  attr_accessor :ip_port
  def initialize(ip_port)
    @ip_port = ip_port
  end

  def host
    @ip_port.split(':').first
  end

  def port
    @ip_port.split(':').second
  end
end
