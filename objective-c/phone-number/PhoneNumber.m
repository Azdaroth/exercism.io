#import "PhoneNumber.h"

@interface PhoneNumber ()

@property (nonatomic, strong) NSString *originalNumber;
@property (nonatomic, strong) NSString *invalidNumber;

@end

@implementation PhoneNumber

- (PhoneNumber *)initWithString:(NSString *)originalNumber {
    self = [super init];
    if (self) {
        _originalNumber = originalNumber;
        _invalidNumber = @"0000000000";
    }
    return self;
}

- (NSString *)number {

    NSString *normalizedNumber = [self normalizeNumber:self.originalNumber];

    if ([self specialNumber:normalizedNumber]) {
        normalizedNumber = [self normalizeSpecialNumber:normalizedNumber];
    }

    if ([self normalizedNumberIsInvalid:normalizedNumber]) {
        return self.invalidNumber;
    }

    return normalizedNumber;
}

- (NSString *)areaCode {
    return [[self number] substringWithRange:NSMakeRange(0, 3)];
}

- (NSString *)description {
    NSString *prettyAreaCode = [@"(" stringByAppendingString:[self.areaCode stringByAppendingString:@")"]];
    NSString *middlePart = [[self number] substringWithRange:NSMakeRange(3, 3)];
    NSString *lastPart = [[self number] substringWithRange:NSMakeRange(6, 4)];

    NSMutableString *finalNumber = [[NSString alloc] init];

    finalNumber = [finalNumber stringByAppendingString:prettyAreaCode];
    finalNumber = [finalNumber stringByAppendingString:@" "];
    finalNumber = [finalNumber stringByAppendingString:middlePart];
    finalNumber = [finalNumber stringByAppendingString:@"-"];
    finalNumber = [finalNumber stringByAppendingString:lastPart];

    return finalNumber;
}

- (NSString *)normalizeNumber:(NSString *)number {
    NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:@"[\(\)\\s\-\\.]" options:NSRegularExpressionCaseInsensitive error:nil];

    return [regexp stringByReplacingMatchesInString:number options:0 range:NSMakeRange(0, [number length]) withTemplate: @""];
}

- (BOOL)normalizedNumberIsInvalid:(NSString *)number {
    return [number length] != 10;
}

- (BOOL)specialNumber:(NSString *)number {
    return [number length] == 11 && [[NSString stringWithFormat:@"%c", [number characterAtIndex:0]] isEqualToString:@"1"];
}

- (NSString *)normalizeSpecialNumber:(NSString *)number {
    return [number substringWithRange:NSMakeRange(1, [self.originalNumber length] - 1)];
}


@end
