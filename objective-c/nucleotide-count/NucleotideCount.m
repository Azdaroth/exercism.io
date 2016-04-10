#import "NucleotideCount.h"

@interface DNA ()

@property (nonatomic, strong) NSString *strand;
@property (nonatomic, strong) NSArray *dnanucleotides;
@property (nonatomic, strong) NSArray *validNucleotides;

@end

@implementation DNA

- (DNA *)initWithStrand:(NSString *)strand {
    self = [super init];
    if (self) {
        _strand = strand;
        _dnanucleotides = @[@"A", @"T", @"C", @"G"];
        _validNucleotides = @[@"A", @"T", @"C", @"G", @"U"];
    }
    return self;
}

- (NSUInteger)count:(NSString *)nucleotide {
    [self validateNucleotide: nucleotide];
    int counter = 0;
    for (int nucleotideIndex = 0; nucleotideIndex < [self.strand length]; nucleotideIndex++) {
        NSString *currentNucleotide = [NSString stringWithFormat:@"%c", [self.strand characterAtIndex:nucleotideIndex]];
        if ([nucleotide isEqualTo:currentNucleotide]) {
            counter++;
        }
    }
    return counter;
}

- (NSDictionary *)nucleotideCounts {
    NSMutableDictionary *aggregate = [NSMutableDictionary dictionary];
    for (NSString *nucleotide in self.dnanucleotides) {
        aggregate[nucleotide] = [NSNumber numberWithInt:[self count:nucleotide]];
    }
    return aggregate;
}

- (void)validateNucleotide:(NSString *)nucleotide {
    if (![self.validNucleotides containsObject:nucleotide]) {
        [NSException raise:@"This is an invalid nucleotide" format:@""];
    }
}

@end