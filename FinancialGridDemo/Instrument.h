//
//  Instrument.h
//  FinancialGridDemo
//
//  Created by Jan Akerman on 02/04/2013.
//
//  Copyright 2013 Scott Logic
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, InstrumentType) {
    InstrumentTypeCurrency,
    InstrumentTypeEquity,
};

@interface Instrument : NSObject

@property InstrumentType type;
@property NSString *name;
@property NSNumber *amount;
@property NSNumber *bidSell;
@property NSNumber *bidSellDelta;
@property NSNumber *askBuy;
@property NSNumber *askBuyDelta;
@property NSNumber *spread;
@property NSNumber *high;
@property NSNumber *low;
@property NSNumber *netChange;
@property NSNumber *percentChange;
@property NSDate *lastUpdated;

@end
