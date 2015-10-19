Pod::Spec.new do |s|
  s.name         = "RescueSDK"
  s.version      = "1.0.0"
  s.summary      = "LogMeIn Rescue SDK for iOS."
  s.description  = <<-DESC
  You can add remote support to your iOS application with LogMeIn Rescue SDK.  
                   DESC
  s.homepage     = "https://www.logmeinrescue.com/"
  s.license      = "Copyright (c) 2003-2015 LogMeIn Inc."
  s.author             = "LogMeIn Inc."
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/LogmeinRescue/iOS-SDK.git", :tag => s.version.to_s }
  s.source_files  = "SDK/include/*.h"
  s.vendored_libraries = 'SDK/lib/fat/libRescueLib.a'
  s.public_header_files = "SDK/include/*.h"
  s.resource  = "SDK/lib/LocalisationBundle.bundle"

  s.prepare_command = <<-CMD
  mkdir -p SDK/lib/fat
  libtool -static SDK/lib/arm/libRescueLib.a SDK/lib/i386/libRescueLib.a -o SDK/lib/fat/libRescueLib.a
                      CMD


  s.frameworks = "CFNetwork", "CoreBluetooth", "CoreTelephony", "SystemConfiguration"
  s.libraries = "resolv", "z", "c++"
  s.requires_arc = true
  s.pod_target_xcconfig = { "OTHER_LDFLAGS" => "-ObjC" }
end
