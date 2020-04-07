
Pod::Spec.new do |spec|

  spec.name         = "huionepay"
  spec.version      = "0.0.1"
  spec.summary      = "A short description of huionepay."
  spec.description  = <<-DESC
                   DESC
  spec.homepage     = "https://github.com/weifucheng1102/eros-plugin-ios-huionepay"
  spec.license      = "MIT (example)"
  spec.author             = { "weifucheng" => "770534748@qq.com" }
  spec.source       = {  :git => "https://github.com/weifucheng1102/eros-plugin-ios-huionepay.git", :tag => spec.version.to_s  }
  spec.source_files  = "Classes", "Classes/**/*.{h,m}"
  spec.exclude_files = "Classes/Exclude"

end
