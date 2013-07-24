//
//  ViewController.m
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

#import "ViewController.h"

#import "UpdateHighlightCell.h"
#import "UpdateInstrumentNameCell.h"

#import "MyInstrumentList.h"

#import "StockManager.h"

@interface ViewController () <SDataGridDataSourceHelperDelegate>

@end

@implementation ViewController {
    SDataGridDataSourceHelper *_dataSourceHelper;
    
    StockManager *_stockManager;
    
    NSNumberFormatter *_decimalFormatter;
    NSDateFormatter *_dateFormatter;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Create a number formatter that will output number with decimal places.
    _decimalFormatter = [[NSNumberFormatter alloc] init];
    _decimalFormatter.usesGroupingSeparator = YES;
    _decimalFormatter.groupingSize = 3;
    _decimalFormatter.groupingSeparator = @",";
    _decimalFormatter.maximumFractionDigits = 5;
    _decimalFormatter.minimumFractionDigits = 2;
    _decimalFormatter.minimumIntegerDigits = 1;
    
    // Create a date formatter that will output a time only.
    _dateFormatter = [[NSDateFormatter alloc] init];
    _dateFormatter.dateFormat = @"HH:mm:ss";

    // Setup and style the grid.
    [self setupGrid];
    [self styleGrid];
    
    // Create our instrument list - this is mock data.
    MyInstrumentList *instrumentsList = [[MyInstrumentList alloc] init];
    
    // Set up the data-source helper and give it our list of instruments as its data array.
    _dataSourceHelper = [[SDataGridDataSourceHelper alloc] initWithDataGrid:_financialGrid];
    _dataSourceHelper.delegate = self;
    _dataSourceHelper.data = instrumentsList.instruments;
    
    // Create our stock manager that handles the updating of the stock objects and the refreshing of the grid.
    _stockManager = [[StockManager alloc] initWithInstrumentList:instrumentsList andGrid:_financialGrid];
    [_stockManager startManager];

    // When our button is clicked we want it to call the tradeSelectedButtonTapped method below.
    [_tradeSelectedButton addTarget:self action:@selector(tradeSelectedButtonTapped) forControlEvents:UIControlEventTouchUpInside];
}

// This method pops up an alert view with the names of the instruments currently selected in the grid.
- (void)tradeSelectedButtonTapped {
    
    // Get the selected model objects associated with the grid rows that are currently selected.
    NSArray *selectedInstruments = _dataSourceHelper.selectedItems;
    
    // Create a string listing the names of the instruments that are currently selected.
    NSMutableString *instrumentsToTradeString = [[NSMutableString alloc] init];
    for (Instrument *instrument in selectedInstruments) {
        [instrumentsToTradeString appendFormat:@"%@\n", instrument.name];
    }
    
    // Print out this list in an alert view.
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"The following instruments will be traded shortly:" message:instrumentsToTradeString delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
}

// This method create the grid and sets up the columns on it.
- (void)setupGrid {
    
    // You can remove this line if you have a full version of ShinobiGrids.
    _financialGrid.licenseKey = @""; // TODO: add your trial licence key here!
    
    // Prohibit selection and editing.
    _financialGrid.singleTapEventMask = SDataGridEventSelect;
    _financialGrid.doubleTapEventMask = SDataGridEventNone;
    
    // Allow selection of multiple grid rows.
    _financialGrid.selectionMode = SDataGridSelectionModeRowMulti;
    
    // Here we add the columns to the grid, specifying a column width, and the property on our model object that the column will be presenting data from.
    // Add the name column.
    SDataGridColumn *nameColumn = [[SDataGridColumn alloc] initWithTitle:@"Instrument" forProperty:@"name" cellType:[UpdateInstrumentNameCell class] headerCellType:nil];
    nameColumn.width = @148;
    // Set the name column to enable sorting in two states only.
    nameColumn.sortMode = SDataGridColumnSortModeBiState;
    [_financialGrid addColumn:nameColumn];
    
    // Add the amount column.
    SDataGridColumn *amountColumn = [[SDataGridColumn alloc] initWithTitle:@"Amount" forProperty:@"amount"];
    amountColumn.width = @95;
    // Set the name column to enable sorting in two states only.
    amountColumn.sortMode = SDataGridColumnSortModeBiState;
    [_financialGrid addColumn:amountColumn];
    
    // Add the bid/sell column.
    SDataGridColumn *bidSellColumn = [[SDataGridColumn alloc] initWithTitle:@"Bid / Sell" forProperty:@"bidSell" cellType:[UpdateHighlightCell class] headerCellType:nil];
    bidSellColumn.width = @115;
    [_financialGrid addColumn:bidSellColumn];
    
    // Add the ask/buy column.
    SDataGridColumn *askBuyColumn = [[SDataGridColumn alloc] initWithTitle:@"Ask / Buy" forProperty:@"askBuy" cellType:[UpdateHighlightCell class] headerCellType:nil];
    askBuyColumn.width = @115;
    [_financialGrid addColumn:askBuyColumn];
    
    // Add the spread column.
    SDataGridColumn *spreadColumn = [[SDataGridColumn alloc] initWithTitle:@"Spread" forProperty:@"spread"];
    spreadColumn.width = @90;
    [_financialGrid addColumn:spreadColumn];
    
    // Add the high column.
    SDataGridColumn *highColumn = [[SDataGridColumn alloc] initWithTitle:@"High" forProperty:@"high"];
    highColumn.width = @80;
    [_financialGrid addColumn:highColumn];
    
    // Add the low column.
    SDataGridColumn *lowColumn = [[SDataGridColumn alloc] initWithTitle:@"Low" forProperty:@"low"];
    lowColumn.width = @80;
    [_financialGrid addColumn:lowColumn];
    
    // Add the net change column.
    SDataGridColumn *netChangeColumn = [[SDataGridColumn alloc] initWithTitle:@"Change" forProperty:@"netChange"];
    netChangeColumn.width = @100;
    [_financialGrid addColumn:netChangeColumn];
    
    // Add the percent change column.
    SDataGridColumn *percentChange = [[SDataGridColumn alloc] initWithTitle:@"% Change" forProperty:@"percentChange"];
    percentChange.width = @100;
    [_financialGrid addColumn:percentChange];
    
    // Add the last updated column.
    SDataGridColumn *lastUpdated = [[SDataGridColumn alloc] initWithTitle:@"Updated" forProperty:@"lastUpdated"];
    lastUpdated.width = @100;
    [_financialGrid addColumn:lastUpdated];
}

// This method styles the grid
- (void)styleGrid {
    
    // Set the default style for rows.
    UIColor *defaultCellBackgroundColor = [UIColor whiteColor];
    UIColor *defaultCellTextColor = [UIColor darkGrayColor];
    UIFont *defaultCellTextFont = [UIFont fontWithName:@"Gill Sans" size:12.];
    _financialGrid.defaultCellStyleForRows = [SDataGridCellStyle styleWithBackgroundColor:defaultCellBackgroundColor withTextColor:defaultCellTextColor withFont:defaultCellTextFont];
    _financialGrid.defaultCellStyleForRows.textAlignment = NSTextAlignmentCenter;
    _financialGrid.defaultCellStyleForRows.textVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    _financialGrid.defaultRowHeight = @40;
    
    // Set the default style for header rows.
    UIColor *headerBackgroundColor = [UIColor colorWithRed:10/255. green:134/255. blue:201/255. alpha:1];
    _financialGrid.defaultCellStyleForHeaderRow = [SDataGridCellStyle styleWithBackgroundColor:headerBackgroundColor withTextColor:nil withFont:nil];
    _financialGrid.defaultHeaderRowHeight = @40;
    
    // Set the alternate row style.
    UIColor *alternateRowBackgroundColor = [UIColor colorWithRed:215/255. green:235/255. blue:245/255. alpha:1];
    _financialGrid.defaultCellStyleForAlternateRows = [SDataGridCellStyle styleWithBackgroundColor:alternateRowBackgroundColor withTextColor:defaultCellTextColor withFont:nil];
    
    // Set the selected row style.
    UIColor *selectedRowBackgroundColor = [UIColor colorWithRed:189/255. green:189/255. blue:189/255. alpha:1];
    _financialGrid.defaultCellStyleForSelectedRows = [SDataGridCellStyle styleWithBackgroundColor:selectedRowBackgroundColor withTextColor:nil withFont:nil];
    _financialGrid.defaultCellStyleForRows.textAlignment = NSTextAlignmentCenter;
    _financialGrid.defaultCellStyleForSelectedRows.textVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    
    // Set some scroll view properties on the grid.
    _financialGrid.bounces = YES;
    _financialGrid.alwaysBounceVertical = YES;
    _financialGrid.alwaysBounceHorizontal = NO;
    
    // Set the grids background image.
    // Background image courtosy of http://subtlepatterns.com/
    _financialGrid.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wavegrid.png"]];
}


// This method gives us an opportunity to format the properties being rendered to te grid from our model object.
-(id)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper displayValueForProperty:(NSString *)propertyKey withSourceObject:(id)object {
    
    Instrument *instrument = (Instrument *)object;
    
    // Format these columns with the decimal formatter.
     if ([propertyKey isEqualToString:@"spread"] || [propertyKey isEqualToString:@"high"] || [propertyKey isEqualToString:@"low"] || [propertyKey isEqualToString:@"netChange"] || [propertyKey isEqualToString:@"percentChange"]) {
        
        return [_decimalFormatter stringFromNumber:[instrument valueForKey:propertyKey]];
        
    // Format the last updated column with the date formatter.
    } else if ([propertyKey isEqualToString:@"lastUpdated"]) {
        
        return [_dateFormatter stringFromDate: [instrument valueForKey:propertyKey]];
    }
    
    // If we return nil instead of a formatted value the data-source helper will use the properties default format.
    return nil;
}

// This method gives us an opportunity to manually render and custom cells in the grid. We need to do this because the grid has no idea how to render our custom cells.
-(BOOL)dataGridDataSourceHelper:(SDataGridDataSourceHelper *)helper populateCell:(SDataGridCell *)cell withValue:(id)value forProperty:(NSString *)propertyKey sourceObject:(id)object {
    Instrument *instrument = (Instrument *)object;
    
    // The name cell is using a custom cell so we must populate it manually.
    if ([propertyKey isEqualToString:@"name"]) {
        // Cast the cell given to us to an UpdateInstrumentNameCell as we specified that the name column will be using this custom cell when we set it up.
        UpdateInstrumentNameCell *nameCell = (UpdateInstrumentNameCell *)cell;
        
        // Set the name cell's text label to the name of the instrument.
        nameCell.label.text = instrument.name;
        
        if ([_stockManager.recentlyUpdatedInstruments containsObject:instrument]) {
            [nameCell showHighlight];
        }
        
        // We return YES so that the data-source helper knows we have manually populated our custom cell, so that it knows it doesn't have to attempt to populate it.
        return YES;
    // We are using the same custom cell for the bidSell and the askBuy column. We must populate cells in these columns manually.
    } else if ([propertyKey isEqualToString:@"bidSell"] || [propertyKey isEqualToString:@"askBuy"]) {
        // Cast the cell given to us to an UpdateHighlightCell as we specified that these columns will be using this custom cell when we set up the columns.
        UpdateHighlightCell *highlightCell = (UpdateHighlightCell *)cell;
        
        // Set the cells label to a formatted version of the property we are populating.
        highlightCell.label.text = [_decimalFormatter stringFromNumber:[instrument valueForKey:propertyKey]];
        
        // Get the change in value for the property we are populating and tell the cell to show the correct arrow.
        NSNumber *delta = [instrument valueForKey:[propertyKey stringByAppendingString:@"Delta"]];
        [highlightCell showArrowForDelta:delta];
        
        // If the instrument we are currently rendering is in the recently updated list then trigger the correct highlight for the change in value.
        if ([_stockManager.recentlyUpdatedInstruments containsObject:instrument]) {
            [highlightCell showHighlightForDelta:delta];
        }
        
        // We return YES so that the data-source helper knows we have manually populated our custom cell, so that it knows it doesn't have to attempt to populate it.
        return YES;
    }
    
    // We return NO for all other cells so that the data-source helper knows it needs to populate them for us.
    return NO;
}

// When a row is selected show the trade button.
-(void)shinobiDataGrid:(ShinobiDataGrid *)grid didSelectRow:(SDataGridRow *)row {
    _tradeSelectedButton.hidden = NO;
}

// When a row is deselected, hide the trade button if there are no other rows selected.
-(void)shinobiDataGrid:(ShinobiDataGrid *)grid didDeselectRow:(SDataGridRow *)row {
    if (_financialGrid.selectedRows.count == 0) {
        _tradeSelectedButton.hidden = YES;
    }
}

// Get rid of vertical grid lines.
-(SDataGridLineStyle *)shinobiDataGrid:(ShinobiDataGrid *)grid styleForVerticalGridLineAtIndex:(NSInteger)gridLineIndex {
    return [SDataGridLineStyle styleWithWidth:0 withColor:nil];
}



@end
