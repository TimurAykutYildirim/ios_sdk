//
//  ADJEvent.m
//  adjust
//
//  Created by Pedro Filipe on 15/10/14.
//  Copyright (c) 2014 adjust GmbH. All rights reserved.
//

#import "ADJEvent.h"

#pragma mark -

@implementation ADJEvent

+ (ADJEvent *)eventWithEventToken:(NSString *)eventToken {
    return [[ADJEvent alloc] initWithEventToken:eventToken];
}

- (id) initWithEventToken:(NSString *)eventToken {
    self = [super init];
    if (self == nil) return nil;

    self.eventToken = eventToken;

    return self;
}

- (void) addCallbackParameter:(NSString *)key
                     andValue:(NSString *)value {
    if (_callbackParameters == nil) {
        _callbackParameters = [[NSMutableDictionary alloc] init];
    }

    [_callbackParameters setObject:value forKey:key];
}

- (void) addPartnerParameter:(NSString *)key
                    andValue:(NSString *)value {
    if (_partnerParameters == nil) {
        _partnerParameters = [[NSMutableDictionary alloc] init];
    }

    [_partnerParameters setObject:value forKey:key];
}

- (void) setRevenue:(double) amount currency:(NSString *)currency{
    _revenue = [NSNumber numberWithDouble:amount];
    _currency = currency;
}

- (void) setTransactionId:(NSString *)transactionId {
    _transactionId = transactionId;
}

-(id)copyWithZone:(NSZone *)zone
{
    ADJEvent* copy = [[[self class] allocWithZone:zone] init];
    if (copy) {
        copy.eventToken = [self.eventToken copyWithZone:zone];
        copy.revenue = [self.revenue copyWithZone:zone];
        copy.callbackParameters = [self.callbackParameters copyWithZone:zone];
        copy.partnerParameters = [self.partnerParameters copyWithZone:zone];
        copy.transactionId = [self.transactionId copyWithZone:zone];
        copy.currency = [self.currency copyWithZone:zone];
    }
    return copy;

}

@end
