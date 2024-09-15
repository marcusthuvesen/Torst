# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Törst' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Törst

	pod 'Firebase/Analytics'
	pod 'Firebase/Database'
	pod 'TPInAppReceipt'
	pod 'SwiftyStoreKit'
	pod 'SwiftGifOrigin'

post_install do |installer|
    installer.generated_projects.each do |project|
        project.targets.each do |target|
            target.build_configurations.each do |config|
                config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
            end
        end
    end
end
end
