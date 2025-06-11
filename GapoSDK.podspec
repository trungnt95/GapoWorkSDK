Pod::Spec.new do |spec|

  spec.name = "GapoSDK"

  spec.version = "1.0.3"

  spec.summary = "A description of Gapo SDK."

  spec.homepage = "https://gapowork.vn"

  spec.license = { :type => "MIT" }

  spec.author = { "Thang Le" => "lethang255@gmail.com" }

  spec.ios.deployment_target = "13.0"

  spec.source = { :git => "https://github.com/gapoapp/MessageKit.git", :tag => "#{spec.version}" }

  spec.vendored_frameworks = 'GapoSDK.xcframework'

  spec.dependency 'SDWebImage', '5.8.4'
  spec.dependency 'SDWebImageWebPCoder', '0.6.1'
  spec.dependency 'SDWebImageLottieCoder', '0.1.0'
  spec.dependency 'LiveKitClient', '2.0.16'
  spec.dependency 'RealmSwift', "10.54.1"
  spec.dependency 'RxSwift', '5.1.1'
  spec.dependency 'RxCocoa', '5.1.1'
  spec.dependency 'Action', '4.2.0'
  spec.dependency 'RxDataSources', '4.0.1'
  spec.dependency 'RxKeyboard', '1.0.0'
  spec.dependency 'RxGesture', '3.0.2'
  spec.dependency 'CocoaMQTT', '2.1.6'
  spec.dependency 'PureLayout', '3.1.9'
  spec.dependency 'FittedSheets', '2.6.1'
  spec.dependency 'Moya', '15.0.0'
  spec.dependency 'lottie-ios', '3.5.0'
  spec.dependency 'SVProgressHUD', '2.2.5'
  spec.dependency 'SkeletonView', '1.30.4'
  spec.dependency 'PromiseKit', '6.13.1'
  spec.dependency 'Parchment', '3.2.0'
  spec.dependency 'SwiftEntryKit', '2.0.0'
  spec.dependency 'Kingfisher', '4.10.1'
  
end
