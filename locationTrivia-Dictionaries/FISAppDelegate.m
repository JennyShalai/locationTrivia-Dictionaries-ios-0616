//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    // returns a shortened location name
    NSString *name = location[@"name"];
    if ( [name length] > length ) {
        name = [name substringToIndex:length];
        return name;
    } else {
        return name;
    }
}

- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSMutableDictionary *newDictionary = [[NSMutableDictionary alloc] init];
    [newDictionary setValue:name forKey:@"name"];
    [newDictionary setValue:@(latitude) forKey:@"latitude"];
    [newDictionary setValue:@(longitude) forKey:@"longitude"];
    return newDictionary;
}

- (NSArray *)namesOfLocations:(NSArray *)locations {
    NSMutableArray *arrayOfLocations = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations) {
        NSString *nameOfLocation = location[@"name"];
        [arrayOfLocations addObject:nameOfLocation];
    }
    return arrayOfLocations;
}

- (BOOL)dictionaryIsValidLocation:(NSDictionary *)dictionary {
    NSArray *keys = [dictionary allKeys];
    if ([keys count] != 3) {
        return false;
    } else if ([keys containsObject: @"name"] && [keys containsObject: @"latitude"] && [keys containsObject: @"longitude"]) {
        return true;
    } else {
        return false;
    }
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    for (NSDictionary *location in locations) {
        if ([location[@"name"] isEqual:name]) {
            return location;
        }
    }
    return nil;
}



@end
