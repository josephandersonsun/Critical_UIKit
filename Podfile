project 'Critical.X.xcodeproj'

# Uncomment the next line to define a global platform for your project
 platform :ios, '12.0'

  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

def testing_pods
  # Pods for Critical.X
pod 'TextFieldEffects'
pod 'AKLabel'
pod 'McPicker'
pod 'LTMorphingLabel'
pod 'DatePickerDialog'
pod 'SCLAlertView'
pod 'lottie-ios'
pod 'EasyPeasy'
pod 'SteviaLayout'
pod 'OnboardKit'
pod 'Siren'
pod 'TTSegmentedControl'
pod 'IQKeyboardManagerSwift'

end

#pods for Critical Main
target 'Critical.X' do

    testing_pods
end
# pod for Calstar 
target 'Critical-CalStar' do

    testing_pods
end

  target 'Critical.XTests' do
    inherit! :search_paths
    # Pods for testing
  end



  target 'Critical.XUITests' do
    inherit! :search_paths
    # Pods for testing
  end



post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['ENABLE_BITCODE'] = 'NO'
      config.build_settings['ARCHS'] = 'arm64'
    end
  end
end
