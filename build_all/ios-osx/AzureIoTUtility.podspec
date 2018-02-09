# Podspec files (like this one) are Ruby code

Pod::Spec.new do |s|
  s.name             = 'AzureIoTUtility'
  s.version          = '0.0.0.1-pre-release.0.0.1'
  s.summary          = 'Unfinished AzureIoT C-Utility preview library for CocoaPods.'

  s.description      = <<-DESC
This is an unfinished (and non-functional) preview CocoaPods 
release of the Azure C Shared Utility library,
which is part of the Microsoft Azure IoT C SDK.
                       DESC

  s.homepage         = 'https://github.com/Azure/azure-c-shared-utility/build_all/ios'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Microsoft' => '' }
  s.source           = { :git => 'https://github.com/Azure/azure-c-shared-utility.git', :branch => 'ios-pod' }

  s.ios.deployment_target = '8.0'
  
  # This bash command is performed after the git repo is cloned. It puts
  # some outlier header files where CocoaPods finds them convenient, and
  # removes some files that should be ignored. 
  s.prepare_command = <<-CMD
  cp pal/generic/refcount_os.h inc/azure_c_shared_utility
  cp adapters/linux_time.h inc
  cp pal/ios-osx/*.h inc/azure_c_shared_utility
  rm -f src/etwlogger_driver.c
  rm -f src/etwxlogging.c
  rm -f src/tlsio_cy*.*
  rm -f src/tlsio_wolf*.*
  rm -f src/tlsio_openssl.c
  rm -f src/tlsio_schannel.c
  rm -f src/x509_schannel.c
  rm -f src/x509_openssl.c
  CMD

  s.source_files = 
    'inc/azure_c_shared_utility/*.h', 
    'src/*.c', 
    'pal/tlsio_options.c', 
    'pal/agenttime.c',
    'pal/ios-osx/*.c',
    'adapters/lock_pthreads.c', 
    'adapters/threadapi_pthreads.c', 
    'adapters/linux_time.c', 
    'adapters/tickcounter_linux.c', 
    'adapters/uniqueid_linux.c', 
    'adapters/httpapi_compact.c', 
    'adapters/threadapi_pthreads.c'

  s.public_header_files = 'inc/azure_c_shared_utility/*.h'
  
  # The header_mappings_dir is a location where the header files directory structure
  # is preserved.  If not provided the headers files are flattened.
  s.header_mappings_dir = 'inc/'
  
  s.xcconfig = {
    'USE_HEADERMAP' => 'NO',
    'HEADER_SEARCH_PATHS' => '"${SRCROOT}/AzureIoTUtility/inc/"',
    'ALWAYS_SEARCH_USER_PATHS' => 'NO'
  }
end
