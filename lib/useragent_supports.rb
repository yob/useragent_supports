# coding: utf-8

require 'json'
require 'useragent'

class UseragentSupports
  Browser = Struct.new(:browser, :version)

  CODES = {
    "ie"      => "Internet Explorer",
    "firefox" => "Firefox",
    "safari"  => "Safari",
    "chrome"  => "Chrome",
    "opera"   => "Opera"
  } 

  def self.data
    path = File.join(File.expand_path(File.dirname(__FILE__)), "..", "support","data.json")
    @data ||= File.open(path, "rb") { |io| JSON.load(io) }.fetch("data")
  end

  def self.browsers
    @browsers ||= begin
                    result = Hash.new
                    UseragentSupports.data.each do |name, values|
                      result[name.to_sym] ||= []
                      values["stats"].each do |abbrev, versions|
                        browser_name = CODES[abbrev]
                        if browser_name
                          versions.each do |version, supported|
                            result[name.to_sym] << Browser.new(browser_name, "#{version}.0") if supported == "y" || supported == "a"
                          end
                        end
                      end
                    end
                    result
                  end
  end

  def print
    UseragentSupports.browsers.each do |feature, browsers|
      puts
      puts feature
      puts browsers.inspect
    end
    nil
  end

  def feature(name, user_agent_string)
    supported_browsers = UseragentSupports.browsers[name] || []
    user_agent         = UserAgent.parse(user_agent_string)
    supported_browsers.any? { |browser| user_agent >= browser }
  end
end
