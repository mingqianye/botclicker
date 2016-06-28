class PhantomjsConfigService
  class << self
    def get(proxy)
      {
        'phantomjs.page.settings.userAgent'    => user_agent,
        'phantomjs.page.customHeaders.Referer' => referer,
        'phantomjs.page.customHeaders.Accept-Language' => accepted_language,
        'phantomjs.cli.args'                   => ["--proxy=#{proxy.ip_port}", '--proxy-type=http']
      }
    end

    def user_agent
      'Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/28.0.1468.0 Safari/537.36'
    end

    def referer
      'http://weibo.com/u/2957260672?topnav=1&wvr=6&topsug=1&is_all=1'
    end

    def accepted_language
      'en-US,en;q=0.8,zh-CN;q=0.6,zh;q=0.4,zh-TW;q=0.2'
    end
  end
end
