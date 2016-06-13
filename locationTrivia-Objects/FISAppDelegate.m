//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

-(NSArray *)allLocationNames {
    NSMutableArray *allLocationNames = [[NSMutableArray alloc] init];
    for (FISLocation *location in self.locations) {
        [allLocationNames addObject:location.name];
    }
    return allLocationNames;
}

-(FISLocation *)locationNamed:(NSString *)name {
    NSPredicate *namePredicate = [NSPredicate predicateWithFormat:@"%K == %@", @"name", name];
    NSArray *filteredByName = [self.locations filteredArrayUsingPredicate:namePredicate];
    
    if ([self.locations count] == 0 || [filteredByName count] == 0) {
        return nil;
    }
    return filteredByName[0];
}

-(NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    NSMutableArray *locationsNearCoordinate = [[NSMutableArray alloc] init];
    for (FISLocation *location in self.locations) {
        if (location.latitude >= latitude - margin && location.latitude <= latitude + margin &&
            location.longitude >= longitude - margin && location.longitude <= longitude + margin) {
            [locationsNearCoordinate addObject:location];
            }
    }
    return locationsNearCoordinate;
}
@end
