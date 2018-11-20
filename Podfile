# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'
source 'https://github.com/CocoaPods/Specs.git'
source 'git@github.com:mercadolibre/mobile-ios_specs.git'

target 'MercadoPagoSDKExampleSwift' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  pod 'MercadoPagoSDKV4', :git => 'git@github.com:mercadopago/px-ios.git', :branch => 'addIdentifiers'
  # Pods for MercadoPagoSDKExampleSwift
  # pod 'MercadoPagoSDKV4/ESC'
  pod 'PXAccountMoneyPlugin', '4.0.0'

  target 'MercadoPagoSDKExampleSwiftTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'MercadoPagoSDKExampleSwiftUITests' do
    inherit! :search_paths
    # Pods for testing
  end

end
