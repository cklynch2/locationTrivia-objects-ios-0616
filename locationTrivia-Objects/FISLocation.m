//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Flatiron School on 6/13/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

-(instancetype)init {
    return [self initWithName:@"" latitude:0.0 longitude:0.0];
}

-(instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [super init];
    
    if (self) {
        _name = name;
        _latitude = latitude;
        _longitude = longitude;
        _trivia = [[NSMutableArray alloc] init];
    }
    return self;
}

-(NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    NSString *truncatedName = [self.name copy];
    if (self.name.length > length) {
        truncatedName = [self.name substringToIndex:length];
    }
    return truncatedName;
}

-(BOOL)hasValidData {
    if ([self.name isEqualToString:@""] || !self.name ||
        self.latitude < -90.0 || self.latitude > 90.0 ||
        self.longitude <= -180.00 || self.longitude > 180.0) {
        return NO;
    }
    return YES;
}

-(FISTrivium *)triviumWithMostLikes {
    if ([self.trivia count] == 0) {
        return nil;
    }
    NSSortDescriptor *likesSorter = [NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO];
    [self.trivia sortUsingDescriptors:@[likesSorter]];
    return self.trivia[0];
}

@end
