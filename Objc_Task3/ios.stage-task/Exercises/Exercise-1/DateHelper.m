#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    NSArray *months = @[@"January", @"February", @"March", @"April", @"May", @"June", @"July", @"August", @"September", @"October", @"November", @"December"];
    
    if (monthNumber > 12 || monthNumber < 1) return nil;
    return months[monthNumber - 1];
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    
    long month = ([date characterAtIndex:5] - '0') * 10 + ([date characterAtIndex:6] - '0');
    long day = ([date characterAtIndex:8] - '0') * 10 + ([date characterAtIndex:9] - '0');
    long hour = ([date characterAtIndex:11] - '0') * 10 + ([date characterAtIndex:12] - '0');
    long minute = ([date characterAtIndex:14] - '0') * 10 + ([date characterAtIndex:15] - '0');
    long second = ([date characterAtIndex:17] - '0') * 10 + ([date characterAtIndex:18] - '0');
    
    if (month > 12 || day > 31 || hour > 24 || minute > 59 || second > 59) return 0;
    
    return day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"EEEEEE";
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    
    return [dateFormatter stringFromDate: date];
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    
    NSDate *today = [NSDate now];
    NSCalendar *calender = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierISO8601];
    
    NSDateComponents *weekComponents =[calender components:(NSCalendarUnitDay |
                                               NSCalendarUnitWeekOfYear) fromDate:date];
    NSDateComponents *todayComponents =
                        [calender components:(NSCalendarUnitDay |
                                               NSCalendarUnitWeekOfYear) fromDate:today];
    
    if (weekComponents.year == todayComponents.year &&
        weekComponents.weekOfYear == todayComponents.weekOfYear) return YES;
    
    return NO;
    
}

@end
