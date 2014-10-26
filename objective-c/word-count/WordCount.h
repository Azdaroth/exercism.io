//
//  WordCount.h
//  WordCount
//
//  Created by FleshGrinder on 22.10.2014.
//  Copyright (c) 2014 FleshGrinder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WordCount : NSObject

- (WordCount *)initWithString:(NSString *)words;
- (NSMutableDictionary *)count;

@end
