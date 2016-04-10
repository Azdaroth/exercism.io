#import "Anagram.h"
#import "Word.h"

@interface Anagram()

@property (nonatomic, strong) Word *word;

@end

@implementation Anagram

- (Anagram *)initWithString:(NSString *)word {
    self = [super init];
    if (self) {
        _word = [[Word alloc] initWithString:word];
    }
    return self;
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


#import "Word.h"

@interface Word ()

@property (nonatomic, strong) NSString *originalWord;
@property (nonatomic, strong) NSString *sortedOriginalWord;

@end

@implementation Word

- (Word *)initWithString:(NSString *)string {
    self = [super init];
    if (self) {
        _originalWord = string;
        _sortedOriginalWord = [self sortAndNormalizeCharacters:string];
        return self;
    }
    return self;
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