//
//  TableViewController.m
//  AnimationFollower
//
//  Created by Gary Lee on 2017/11/2.
//  Copyright © 2017年 LeeG4ng. All rights reserved.
//

#import "TableViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"

@interface TableViewController () <UISearchResultsUpdating>

@property NSArray *nameArray;
@property NSArray *timeArray;
@property NSArray *numberArray;
@property NSArray *countryArray;
@property NSArray *introductionArray;
@property UISearchController *searchCtrl;
@property NSMutableArray *filteredName;
@property NSMutableArray *filteredTime;
@property NSMutableArray *filteredNumber;
@property NSInteger filteredIndex;

@property (nonatomic, strong)NSMutableArray * mutableArr;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.

    self.navigationItem.title = @"追番";
    UIBarButtonItem *addBtn = [[UIBarButtonItem alloc] initWithTitle:@"新增" style:UIBarButtonItemStylePlain target:self action:@selector(didClickAdd)];
    self.navigationItem.rightBarButtonItem = addBtn;

    self.searchCtrl = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchCtrl.searchResultsUpdater = self;
    self.searchCtrl.dimsBackgroundDuringPresentation = NO;
    [self.searchCtrl.searchBar sizeToFit];
    self.tableView.tableHeaderView = self.searchCtrl.searchBar;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    _nameArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"name"];
    _timeArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"time"];
    _numberArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"number"];
    _countryArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"country"];
    _introductionArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"introduction"];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    if(self.searchCtrl.active) {
        return [_filteredName count];
    }
    else {
    return [_nameArray count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellID = @"cellID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    if(self.searchCtrl.active) {
        cell.textLabel.text = [_filteredName objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"上映时间：%@ 集数：%@",[_filteredTime objectAtIndex:indexPath.row],[_filteredNumber objectAtIndex:indexPath.row]];
    }
    else {
        cell.textLabel.text = [_nameArray objectAtIndex:indexPath.row];
        cell.detailTextLabel.text = [NSString stringWithFormat:@"上映时间：%@ 集数：%@",[_timeArray objectAtIndex:indexPath.row],[_numberArray objectAtIndex:indexPath.row]];
    }
    return cell;
}

- (void)didClickAdd {
    AddViewController *addViewCtrl = [[AddViewController alloc] init];
    [self.navigationController pushViewController:addViewCtrl animated:YES];
}

//点击cell
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailViewController *detailViewCtrl = [[DetailViewController alloc] init];
    if(self.searchCtrl.active) {
        self.searchCtrl.active = NO;
        [self.searchCtrl removeFromParentViewController];
        [self.navigationController pushViewController:detailViewCtrl animated:YES];
        detailViewCtrl.index = self.filteredIndex;

    }
    else {
        [self.navigationController pushViewController:detailViewCtrl animated:YES];
        detailViewCtrl.index = indexPath.row;
    }
}

#pragma mark - searchController delegate

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
//    self.filteredNumber = [NSMutableArray array];
//    self.filteredTime = [@[]mutableCopy];
//    self.filteredName = [@[]mutableCopy];
//    NSArray * arr = @[@123, @"adsfsadf"];
//    NSDictionary * dict = @{@"name": @"TomAndJerry", @"Number": @1};
//    NSLog(@"%@", dict[@"name"]);
    self.filteredName = [NSMutableArray array];
    self.filteredTime = [NSMutableArray array];
    self.filteredNumber = [NSMutableArray array];
    NSString *searchString = [self.searchCtrl.searchBar text];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF CONTAINS[c] %@", searchString];
    self.filteredName= [NSMutableArray arrayWithArray:[self.nameArray filteredArrayUsingPredicate:predicate]];
    for(NSString *name in _filteredName) {
        _filteredIndex = [_nameArray indexOfObject:name];
        [_filteredTime addObject:[_timeArray objectAtIndex:_filteredIndex]];
        [_filteredNumber addObject:[_numberArray objectAtIndex:_filteredIndex]];
    }
    [self.tableView reloadData];
}


//- (NSMutableArray *)mutableArr {
//    if (_mutableArr == nil) {
//        _mutableArr = [[NSMutableArray alloc] initWithArray:@[@1, @"123"] copyItems:YES];
//    }
//    return _mutableArr;
//}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
