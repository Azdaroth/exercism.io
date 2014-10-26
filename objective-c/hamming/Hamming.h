//
//  Hamming.h
//  Hamming
//
//  Created by FleshGrinder on 20.10.2014.
//  Copyright (c) 2014 FleshGrinder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Hamming : NSObject

+ (NSUInteger)compute:(NSString *)strand against:(NSString *)otherStrand;

@end
