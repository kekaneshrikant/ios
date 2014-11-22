//
//  FirstTableViewController.m
//  Halloween
//
//  Created by SourceKode on 16/11/14.
//  Copyright (c) 2014 SK. All rights reserved.
//

#import "FirstTableViewController.h"
#import "ChocolateDetailViewController.h"

@interface FirstTableViewController ()

@property(nonatomic,strong) NSMutableArray *indianChocolates;
@property(nonatomic,strong) NSMutableArray *foreignChocolates;

@end

@implementation FirstTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Chocolates";
    
    self.indianChocolates = [[NSMutableArray alloc] initWithObjects:@"Eclairs",@"Toffee Bite",@"Mango Byte",@"Daily Milk", nil];
    self.foreignChocolates = [[NSMutableArray alloc] initWithObjects:@"Lindt",@"Mars",@"Tobblertone",@"Fellero", nil];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    
    switch (section) {
        case 0:
            return self.indianChocolates.count;
            break;
            
        case 1:
            return self.foreignChocolates.count;
            break;
            
    }
    
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell" forIndexPath:indexPath];
    
    
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text = self.indianChocolates[indexPath.row];
            break;
        case 1:
            cell.textLabel.text = self.foreignChocolates[indexPath.row];
            break;
            
        default:
            break;
    }
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case 0:
            return @"Indian Chocolates";
            break;
        case 1:
            return @"Foreign Chocolates";
        default:
            return @"";
            break;
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        switch (indexPath.section) {
            case 0:
                [self.indianChocolates removeObjectAtIndex:indexPath.row];
                break;
            case 1:
                [self.foreignChocolates removeObjectAtIndex:indexPath.row];
                break;
            default:
                break;
        }
        
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    ChocolateDetailViewController *detailViewController = [segue destinationViewController];
    
    
    NSIndexPath *selectedIndexPath = [self.tableView indexPathForSelectedRow];
    
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:selectedIndexPath];
    
    detailViewController.name = cell.textLabel.text;
    
}


@end
