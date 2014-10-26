//
//  Bob.m
//  Bob
//
//  Created by FleshGrinder on 18.10.2014.
//  Copyright (c) 2014 FleshGrinder. All rights reserved.
//

#import "Bob.h"

@interface Bob()

-(BOOL)isBlank:(NSString *)string;
-(BOOL)isQuestion:(NSString *)string;
-(BOOL)isShouting:(NSString *)string;


@end


@implementation Bob

-(NSString *)hey:(NSString *)sentence {
    if ([self isBlank:sentence]) {
        return @"Fine, be that way.";
    } else if ([self isShouting:sentence]) {
        return @"Whoa, chill out!";
    } else if ([self isQuestion:sentence]) {
        return @"Sure.";
    } else {
        return @"Whatever.";
    }
}

-(BOOL)isBlank:(NSString *)string {
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] length] == 0) {
        return YES;
    } else {
        return NO;
    }
}

-(BOOL)isQuestion:(NSString *)string {
    if ([string hasSuffix:@"?"]) {
        return YES;
    } else {
        return NO;
    }
}

-(BOOL)isShouting:(NSString *)string {
    NSString *lettersPattern = @"[A-Za-z]";
    NSError *error = nil;
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:lettersPattern
                                                                            options:NSRegularExpressionCaseInsensitive
                                                                            error:&error];
    NSUInteger lettersCount = [regexp numberOfMatchesInString:string options:0 range: NSMakeRange(0, [string length])];
    
    if ([string isEqualToString:[string uppercaseString]] && lettersCount > 0) {
        return YES;
    } else {
        return NO;
    }
}

@end
