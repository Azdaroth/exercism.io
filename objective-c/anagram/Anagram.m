#import "Anagram.h"
#import "Word.h"

@interface Anagram()

@property (nonatomic, strong) Word *word;

@end

@implementation Anagram

- (Anagram *)initWithString:(NSString *)word {
    self = [super init];
    if (self) {
        self.word = [[Word alloc] initWithString:word];
        return self;
    } else {
        return nil;
    }
}

- (NSArray *)match:(NSArray *)candidates {
    NSMutableArray *anagrams = [[NSMutableArray alloc] init];
    
    for (NSString *anagramCandidate in candidates) {
        
        if ([self.word isAnagramOfWord:anagramCandidate]) {
            [anagrams addObject:anagramCandidate];
        }
    }
    
    return anagrams;
}

@end

@interface Word ()

@property (nonatomic, strong) NSString *originalWord;
@property (nonatomic, strong) NSString *sortedOriginalWord;

@end

@implementation Word

- (Word *)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        self.originalWord = string;
        self.sortedOriginalWord = [self sortAndNormalizeCharacters:string];
        return self;
    } else {
        return nil;
    }
}

- (BOOL)isAnagramOfWord:(NSString *)candidate {
    NSString *sortedCandidate = [self sortAndNormalizeCharacters:candidate];
    return [self.sortedOriginalWord isEqualToString:sortedCandidate] && [[self.originalWord lowercaseString] isNotEqualTo: [candidate lowercaseString]];
}


- (NSString *)sortAndNormalizeCharacters:(NSString *)originalWord {
    NSMutableArray *wordCharacters = [[NSMutableArray alloc] init];
    
    for (int idx=0; idx < [originalWord length]; idx++) {
        [wordCharacters addObject:[NSString stringWithFormat:@"%c", [originalWord characterAtIndex:idx]]];
    }
    
    return [[[wordCharacters sortedArrayUsingSelector:@selector(caseInsensitiveCompare:)] componentsJoinedByString:@""] lowercaseString];
}

@end
