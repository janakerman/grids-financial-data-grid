//
//  MyInstrumentList.m
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

#import "MyInstrumentList.h"


@implementation MyInstrumentList

-(id)init {
    if (self = [super init]) {
        [self setupMockList];
    }
    return self;
}

// This populates the instrument list with a set of mock, hard coded, instruments.
- (void)setupMockList {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
    
    NSMutableArray *newInstrumentsList = [[NSMutableArray alloc] init];
    
    // Create item.
    Instrument *newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeCurrency;
    newInstrument.name = @"EURUSD";
    newInstrument.amount = @5000.00;
    newInstrument.bidSell = @1.3057;
    newInstrument.askBuy = @1.3060;
    newInstrument.spread = @0.8;
    newInstrument.low = @1.3021;
    newInstrument.high = @1.3074;
    newInstrument.netChange = @0.0031;
    newInstrument.percentChange = @0.24;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item.
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeCurrency;
    newInstrument.name = @"GBPUSD";
    newInstrument.amount = @5000.00;
    newInstrument.bidSell = @1.5256;
    newInstrument.askBuy = @1.5260;
    newInstrument.spread = @1.9;
    newInstrument.low = @1.5218;
    newInstrument.high = @1.5267;
    newInstrument.netChange = @1.5260;
    newInstrument.percentChange = @1.5260;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item.
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeCurrency;
    newInstrument.name = @"EURCHF";
    newInstrument.amount = @5000;
    newInstrument.bidSell = @1.2159;
    newInstrument.askBuy = @1.2163;
    newInstrument.spread = @1.9;
    newInstrument.low = @1.2151;
    newInstrument.high = @1.2164;
    newInstrument.netChange = @0.0006;
    newInstrument.percentChange = @0.05;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item.
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeCurrency;
    newInstrument.name = @"AUDUSD";
    newInstrument.amount = @10;
    newInstrument.bidSell = @1.0329;
    newInstrument.askBuy = @1.0333;
    newInstrument.spread = @25;
    newInstrument.low = @1.0270;
    newInstrument.high = @1.0335;
    newInstrument.netChange = @-2.55;
    newInstrument.percentChange = @-0.16;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item.
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeCurrency;
    newInstrument.name = @"USDJPY";
    newInstrument.amount = @0;
    newInstrument.bidSell = @98.40;
    newInstrument.askBuy = @98.43;
    newInstrument.spread = @0;
    newInstrument.low = @97.64;
    newInstrument.high = @98.53;
    newInstrument.netChange = @-98.53;
    newInstrument.percentChange = @-0.30;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item.
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeCurrency;
    newInstrument.name = @"USDCAD";
    newInstrument.amount = @0;
    newInstrument.bidSell = @1.0231;
    newInstrument.askBuy = @1.0234;
    newInstrument.spread = @0;
    newInstrument.high = @1.0277;
    newInstrument.low = @1.0232;
    newInstrument.netChange = @-2.40;
    newInstrument.percentChange = @-0.16;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeCurrency;
    newInstrument.name = @"USDCHF";
    newInstrument.amount = @0;
    newInstrument.bidSell = @0.9306;
    newInstrument.askBuy = @0.9309;
    newInstrument.spread = @0;
    newInstrument.high = @0.9336;
    newInstrument.low = @0.9299;
    newInstrument.netChange = @-0.0020;
    newInstrument.percentChange = @-0.21;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeCurrency;
    newInstrument.name = @"EURJPY";
    newInstrument.amount = @500;
    newInstrument.bidSell = @128.61;
    newInstrument.askBuy = @128.65;
    newInstrument.spread = @0;
    newInstrument.high = @128.78;
    newInstrument.low = @127.17;
    newInstrument.netChange = @0.79;
    newInstrument.percentChange = @0.62;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"VOD";
    newInstrument.amount = @25;
    newInstrument.bidSell = @190.75;
    newInstrument.askBuy = @190.85;
    newInstrument.spread = @0;
    newInstrument.high = @191.25;
    newInstrument.low = @188.33;
    newInstrument.netChange = @2.25;
    newInstrument.percentChange = @1.19;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"GOOG";
    newInstrument.amount = @50;
    newInstrument.bidSell = @781.53;
    newInstrument.askBuy = @781.99;
    newInstrument.spread = @0;
    newInstrument.high = @790.85;
    newInstrument.low = @778.10;
    newInstrument.netChange = @-10.81;
    newInstrument.percentChange = @-1.36;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"AAPL";
    newInstrument.amount = @0;
    newInstrument.bidSell = @402.70;
    newInstrument.askBuy = @402.87;
    newInstrument.spread = @0;
    newInstrument.high = @420.60;
    newInstrument.low = @398.11;
    newInstrument.netChange = @-23.44;
    newInstrument.percentChange = @-5.50;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"JPM";
    newInstrument.amount = @0;
    newInstrument.bidSell = @46.81;
    newInstrument.askBuy = @46.84;
    newInstrument.spread = @0;
    newInstrument.high = @48.18;
    newInstrument.low = @46.38;
    newInstrument.netChange = @-1.69;
    newInstrument.percentChange = @-3.47;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"BAC";
    newInstrument.amount = @55;
    newInstrument.bidSell = @11.68;
    newInstrument.askBuy = @11.68;
    newInstrument.spread = @0;
    newInstrument.high = @48.18;
    newInstrument.low = @46.38;
    newInstrument.netChange = @-0.58;
    newInstrument.percentChange = @-4.72;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"GSK";
    newInstrument.amount = @10;
    newInstrument.bidSell = @1679.00;
    newInstrument.askBuy = @1679.50;
    newInstrument.spread = @0;
    newInstrument.high = @1681.00;
    newInstrument.low = @1643.00;
    newInstrument.netChange = @67.75;
    newInstrument.percentChange = @4.22;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"BATS";
    newInstrument.amount = @10;
    newInstrument.bidSell = @3433.50;
    newInstrument.askBuy = @3435.50;
    newInstrument.spread = @0;
    newInstrument.high = @3561.50;
    newInstrument.low = @3426.25;
    newInstrument.netChange = @-73.75;
    newInstrument.percentChange = @-2.07;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"TLW";
    newInstrument.amount = @7;
    newInstrument.bidSell = @1011.00;
    newInstrument.askBuy = @1013.00;
    newInstrument.spread = @0;
    newInstrument.high = @1019.50;
    newInstrument.low = @992.25;
    newInstrument.netChange = @35.00;
    newInstrument.percentChange = @3.36;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"POLYP";
    newInstrument.amount = @0;
    newInstrument.bidSell = @721.00;
    newInstrument.askBuy = @723.50;
    newInstrument.spread = @0;
    newInstrument.high = @727.00;
    newInstrument.low = @690.25;
    newInstrument.netChange = @19.00;
    newInstrument.percentChange = @2.69;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Create item
    newInstrument = [[Instrument alloc] init];
    newInstrument.type = InstrumentTypeEquity;
    newInstrument.name = @"BLT";
    newInstrument.amount = @0;
    newInstrument.bidSell = @1776.50;
    newInstrument.askBuy = @1778.00;
    newInstrument.spread = @0;
    newInstrument.high = @1787.00;
    newInstrument.low = @1758.00;
    newInstrument.netChange = @-4.75;
    newInstrument.percentChange = @-0.27;
    newInstrument.lastUpdated = [NSDate date];
    [newInstrumentsList addObject:newInstrument];
    
    // Set the objects instruments array to this mock list we created.
    self.instruments = [NSArray arrayWithArray:newInstrumentsList];
}

@end
