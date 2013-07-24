//
//  StockManager.m
//  FinancialGridDemo
//
//  Created by Jan Akerman on 03/04/2013.
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

#import "StockManager.h"
#import <ShinobiGrids/SDataGridRow.h>
#import <ShinobiGrids/SDataGridDataSourceHelper.h>

@implementation StockManager {
    MyInstrumentList *_listToUpdate;
    ShinobiDataGrid *_gridToUpdate;
}

-(id)initWithInstrumentList:(MyInstrumentList *)instrumentList andGrid:(ShinobiDataGrid *)grid {
    if (self = [super init]) {
        
        _recentlyUpdatedInstruments = [[NSMutableArray alloc] init];
        
        _listToUpdate = instrumentList;
        _gridToUpdate = grid;
    }
    return self;
}

- (void)startManager {
    NSTimer *timer = [[NSTimer alloc] initWithFireDate:[NSDate dateWithTimeIntervalSinceNow:2]
                                              interval:2.f
                                                target:self
                                              selector:@selector(updateInstruments)
                                              userInfo:nil
                                               repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

-(void)updateInstruments {
    NSUInteger indexToUpdate = arc4random() % [_listToUpdate.instruments count];
    
    Instrument *instrumentToUpdate = [_listToUpdate.instruments objectAtIndex:indexToUpdate];
    
    NSNumber *newBidSell = [NSNumber numberWithFloat:[instrumentToUpdate.bidSell floatValue] * (((float)random()/RAND_MAX * 0.4) + 0.8f) ];
    instrumentToUpdate.bidSellDelta = [NSNumber numberWithFloat:newBidSell.floatValue  - instrumentToUpdate.bidSell.floatValue];
    instrumentToUpdate.bidSell = newBidSell;
    
    NSNumber *newAskBuy = [NSNumber numberWithFloat:[instrumentToUpdate.askBuy floatValue] * (((float)random()/RAND_MAX * 0.4) + 0.8f)];
    instrumentToUpdate.askBuyDelta = [NSNumber numberWithFloat:newAskBuy.floatValue  - instrumentToUpdate.askBuy.floatValue];
    instrumentToUpdate.askBuy = newAskBuy;
    
    instrumentToUpdate.lastUpdated = [NSDate date];
    
    if ([_gridToUpdate.dataSource isKindOfClass:[SDataGridDataSourceHelper class]]) {
        SDataGridDataSourceHelper *dataSourceHelper = (SDataGridDataSourceHelper *)_gridToUpdate.dataSource;
        
        indexToUpdate = [dataSourceHelper.sortedData indexOfObject:instrumentToUpdate];
    }
    
    [self.recentlyUpdatedInstruments addObject:instrumentToUpdate];
    
    SDataGridRow *rowToUpdate = [SDataGridRow rowWithRowIndex:indexToUpdate sectionIndex:0];
    [_gridToUpdate reloadRows:@[rowToUpdate]];
    
    [self.recentlyUpdatedInstruments removeObject:instrumentToUpdate];
    
    
    
}

@end
