# Podspec files like this one are Ruby code

Pod::Spec.new do |s|
  s.name             = 'AzureIoTUtility'
  s.version          = '0.1.3'
  s.summary          = 'Unfinished AzureIoTUtility preview library for CocoaPods.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
This is an unfinished (and non-functional) preview CocoaPods 
release of the Azure C Shared Utility library,
which is part of the Microsoft Azure IoT C SDK.
                       DESC

  s.homepage         = 'https://github.com/Azure/azure-c-shared-utility'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Roy Sprowl' => 'v-royspr@microsoft.com' }
  s.source           = { :git => 'https://github.com/Azure/azure-c-shared-utility.git', :branch => 'ios-pod' }

  s.ios.deployment_target = '8.0'

  s.source_files = 'src/**/*.c', 'inc/azure_c_shared_utility/*.h', 'inc/', 'pal/tlsio_options.c', 'pal/agenttime.c', 'adapters/uniqueid_linux.c', 'adapters/httpapi_compact.c', 'adapters/threadapi_pthreads.c'
  
  # This bash command is performed after the git repo is cloned. It puts
  # some outlier header files where CocoaPods finds them convenient, and
  # removes some files that should be ignored. 
  s.prepare_command = <<-CMD
  cp pal/generic/refcount_os.h inc/azure_c_shared_utility
  cp pal/objective-c/*.c src
  cp pal/objective-c/*.h inc/azure_c_shared_utility
  rm -f src/etwlogger_driver.c
  rm -f src/etwxlogging.c
  rm -f src/tlsio_cy*.*
  rm -f src/tlsio_wolf*.*
  rm -f src/tlsio_openssl.c
  rm -f src/tlsio_schannel.c
  rm -f src/x509_schannel.c
  rm -f src/x509_openssl.c
  # Restore gballoc.c after Lock is implemented
  rm -f src/gballoc.c
  CMD

  s.public_header_files = 'inc/azure_c_shared_utility/*.h'
  
  # The header_mappings_dir is a location where the header files directory structure
  # is preserved.  If not provided the headers files are flattened.
  s.header_mappings_dir = 'inc/'
  
  s.xcconfig = {
    'USE_HEADERMAP' => 'NO',
    'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/AzureIoTUtility/inc/"',
    'ALWAYS_SEARCH_USER_PATHS' => 'NO'
  }
  # s.dependency 'AFNetworking', '~> 2.3'
end
