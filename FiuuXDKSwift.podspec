Pod::Spec.new do |spec|
  spec.name          = 'FiuuXDKSwift'
  spec.version       = '1.0.6'
  spec.summary       = 'Fiuu payment xdk'
  spec.description   = 'Fiuu payment xdk, acts as bridging to webcore for doing the transaction'
  spec.homepage      = 'https://github.com/FiuuPayment/Mobile-XDK-Fiuu_Swift'
  spec.author        = { 'Fiuu Mobile Team' => 'mobile@fiuu.com' }
  spec.license       = { :type => 'MIT', :file => 'LICENSE' }
  spec.source        = { :git => 'https://github.com/FiuuPayment/Mobile-XDK-Fiuu_Swift.git', :tag => spec.version.to_s }
  spec.swift_version = '5.0'
  spec.ios.deployment_target = '16.0'

  spec.ios.vendored_frameworks = 'FiuuXDKSwift.xcframework'
end
