
Pod::Spec.new do |spec|

  spec.name         = "eros-plugin-ios-huionepay"
  spec.version      = "0.0.1"
  spec.summary      = "huione支付插件."
  spec.homepage     = "https://github.com/weifucheng1102/eros-plugin-ios-huionepay"
  spec.license      = "MIT"
  spec.ios.deployment_target = "8.0"
  spec.author             = { "weifucheng" => "770534748@qq.com" }
  spec.source       = {  :git => "https://github.com/weifucheng1102/eros-plugin-ios-huionepay.git", :tag => spec.version.to_s  }
  spec.source_files  = "Source/*.{h,m,mm}"
  spec.vendored_frameworks = 'Source/*.framework'

end
