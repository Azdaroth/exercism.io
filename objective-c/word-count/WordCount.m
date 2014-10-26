//
//  WordCount.m
//  WordCount
//
//  Created by FleshGrinder on 22.10.2014.
//  Copyright (c) 2014 FleshGrinder. All rights reserved.
//

#import "WordCount.h"

@interface WordCount()

@property (nonatomic, strong) NSMutableArray *list;

@end

@implementation WordCount

- (WordCount *)initWithString:(NSString *)words {
    self = [super init];
    if (self) {
        NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:@"\\w+" options:NSRegularExpressionCaseInsensitive error:nil];
        NSRange range = NSMakeRange(0, [words length]);
        NSArray *matches = [regex matchesInString:words options:0 range:range];
        [self populateListWithMatches:matches fromWords:words];
        return self;
    } else {
        return nil;
    }
}

- (NSMutableDictionary *)count {
    
    NSMutableDictionary *aggregate = [NSMutableDictionary dictionary];

    for(NSString *word in self.list) {
        if ([aggregate objectForKey:word]) {
            int newCount = [aggregate[word] intValue] + 1;
            [aggregate setObject:[NSNumber numberWithInteger:newCount] forKey:word];
        } else {
            [aggregate setObject:@1 forKey:word];
        }
    }
    
    return aggregate;
}

- (void)populateListWithMatches:(NSArray *)matches fromWords:(NSString *)words {
    self.list = [[NSMutableArray alloc] init];
    for (NSTextCheckingResult *match in matches) {
        NSRange matchRange = [match rangeAtIndex:0];
        [self.list addObject:[[words substringWithRange:matchRange] lowercaseString]];
    }
}

@end
