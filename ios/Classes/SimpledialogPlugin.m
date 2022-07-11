#import "DialogpackPlugin.h"
#if __has_include(<dialogpack/dialogpack-Swift.h>)
#import <dialogpack/dialogpack-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "dialogpack-Swift.h"
#endif

@implementation DialogpackPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftDialogpackPlugin registerWithRegistrar:registrar];
}
@end
