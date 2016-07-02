class ObtainBrowserService
  def initialize
    #@proxy = ObtainProxyService.get
    @proxy = ProxyConfig.new(Settings.pi_proxy)
  end


  def try_get_browser
    puts "Using proxy: #{@proxy.ip_port}"
    WaitForNewIpService.wait(@proxy)
    puts 'Trying to get a browser...'
    phantomjs_browser
  end

  private
  def phantomjs_browser
    capabilities = Selenium::WebDriver::Remote::Capabilities.phantomjs(PhantomjsConfigService.get(@proxy))
    driver = Selenium::WebDriver.for :phantomjs, :desired_capabilities => capabilities
    Watir::Browser.new driver
  end

  def firefox
    profile = Selenium::WebDriver::Firefox::Profile.new
    profile.proxy = Selenium::WebDriver::Proxy.new :http => proxy.ip_port, :ssl => proxy.ip_port
    Watir::Browser.new :firefox, :profile => profile
  end
end
