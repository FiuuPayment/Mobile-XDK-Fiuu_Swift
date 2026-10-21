Pod::Spec.new do |spec|
  spec.name          = 'FiuuXDKSwift'
  spec.version       = '2.0.3'
  spec.summary       = 'Fiuu payment xdk'
  spec.description   = 'New Natively Fiuu XDK on Swift framework to proceed on payment'
  spec.homepage      = 'https://github.com/FiuuPayment/Mobile-XDK-Fiuu_Swift'
  spec.author        = { 'Fiuu Mobile Team' => 'mobile@fiuu.com' }
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.source = { :http => "https://github.com/FiuuPayment/Mobile-XDK-Fiuu_Swift/releases/download/#{spec.version}/FiuuXDKSwift.xcframework.zip" }
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '16.0'

  spec.ios.vendored_frameworks = 'FiuuXDKSwift.xcframework'
end
