//
//  Hamming.m
//  Hamming
//
//  Created by FleshGrinder on 20.10.2014.
//  Copyright (c) 2014 FleshGrinder. All rights reserved.
//

#import "Hamming.h"

@implementation Hamming

+ (NSUInteger)compute:(NSString *)strand against:(NSString *)otherStrand {
    int commonLength = MIN([strand length], [otherStrand length]);
    int distance = 0;
    
    for (NSInteger i = 0; i < commonLength; i++) {
        unichar nucleotide = [strand characterAtIndex:i];
        unichar otherNucleotide = [otherStrand characterAtIndex:i];
        
        if (nucleotide != otherNucleotide) {
            distance++;
        }
    }
    
    return distance;
}

@end
