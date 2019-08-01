Pod::Spec.new do |s|
  s.name         = "ScreenShotCustom"
  s.version      = "0.0.1"
  s.summary      = "截图工具"
  s.description  = "截图工具类"
  s.homepage     = "https://github.com/chenzhe555/ScreenShotCustom"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author       = { "陈哲" => "376811578@qq.com" }
  s.source       = { :git => "https://github.com/chenzhe555/ScreenShotCustom.git", :tag => "#{s.version}" }
  s.subspec 'classes' do |one|
      one.source_files = 'ScreenShotCustom/classes/*.{h,m}'
  end
  s.resource_bundles = {
    'ScreenShotCustom' => ['ScreenShotCustom/Assets/*']
  }
  s.platform = :ios, "9.0"
  s.frameworks = "Foundation", "UIKit"
  # s.libraries = "iconv", "xml2"
  s.requires_arc = true
  # s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
