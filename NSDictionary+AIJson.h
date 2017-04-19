//
//  NSDictionary+AIJson.h
//  PanthonCustomer
//
//  Created by JefferyWan on 2017/4/19.
//  Copyright © 2017年 pansheng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (AIJson)
- (NSString *)jsonString: (NSString *)key;

- (NSDictionary *)jsonDict: (NSString *)key;
- (NSArray *)jsonArray: (NSString *)key;
- (NSArray *)jsonStringArray: (NSString *)key;


- (BOOL)jsonBool: (NSString *)key;
- (NSInteger)jsonInteger: (NSString *)key;
- (long long)jsonLongLong: (NSString *)key;
- (unsigned long long)jsonUnsignedLongLong:(NSString *)key;

- (double)jsonDouble: (NSString *)key;
@end
