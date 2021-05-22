#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    
    int i = 0, j = 0;
    NSMutableString *result = [[NSMutableString alloc] init];
    while (i < string1.length && j < string2.length){
        if ([string1 characterAtIndex:i] < [string2 characterAtIndex:j]){
            [result appendString:[NSString stringWithFormat: @"%c", [string1 characterAtIndex:i]]];
            i++;
        }
        else if ([string1 characterAtIndex:i] > [string2 characterAtIndex:j]){
            [result appendString:[NSString stringWithFormat: @"%c", [string2 characterAtIndex:j]]];
            j++;
        }
        else{
            int q = 1;
            BOOL key = 0;
            while (i + q < string1.length && j + q < string2.length){
                if ([string1 characterAtIndex:i + q] < [string2 characterAtIndex:j + q]){
                    [result appendString:[NSString stringWithFormat: @"%c", [string1 characterAtIndex:i]]];
                    i++;
                    key = 1;
                    break;
                }
                else if ([string1 characterAtIndex:i + q] > [string2 characterAtIndex:j + q]){
                    [result appendString:[NSString stringWithFormat: @"%c", [string2 characterAtIndex:j]]];
                    j++;
                    key = 1;
                    break;
                }
                else q++;
            }
            if (key == 0){
                [result appendString:[NSString stringWithFormat: @"%c", [string1 characterAtIndex:i]]];
                i++;
            }
        }
    }
    
    for (i; i < string1.length; i++)
        [result appendString:[NSString stringWithFormat: @"%c", [string1 characterAtIndex:i]]];
    
    for (j; j < string2.length; j++)
        [result appendString:[NSString stringWithFormat: @"%c", [string2 characterAtIndex:j]]];
    
    return result;
}

@end
