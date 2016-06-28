class PhantomjsConfigService
  class << self
    def get(proxy)
      {
        'phantomjs.page.settings.userAgent'    => user_agent,
        'phantomjs.page.customHeaders.Referer' => referer,
        'phantomjs.cli.args'                   => ["--proxy=#{proxy.ip_port}", '--proxy-type=http']
      }
    end

    def user_agent
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36'
    end

    def referer
      'http://weibo.com/u/2957260672?topnav=1&wvr=6&topsug=1&is_all=1'
    end
  end
end
