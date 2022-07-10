#import "SimpledialogPlugin.h"
#if __has_include(<simpledialog/simpledialog-Swift.h>)
#import <simpledialog/simpledialog-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "simpledialog-Swift.h"
#endif

@implementation SimpledialogPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftSimpledialogPlugin registerWithRegistrar:registrar];
}
@end
