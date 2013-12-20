#
# Be sure to run `pod spec lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# To learn more about the attributes see http://docs.cocoapods.org/specification.html
#
Pod::Spec.new do |s|
  s.name         = "UIWebView-WebStorage"
  s.version      = "1.0"
  s.summary      = "UIWebView Category that adds CocoaTouch level hooks to HTML5 web storage."
  s.license      = 'MIT'
  s.author       = { "Colden Prime" => "coldenprime@gmail.com" }
  s.source       = { :git => "https://github.com/cprime/UIWebView-WebStorage", :tag => s.version.to_s }
  s.requires_arc = true
  s.source_files = 'UIWebView-WebStorage'
end
