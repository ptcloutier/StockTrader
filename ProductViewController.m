//
//  ProductViewController.m
//  NavCtrl
//
//  Created by Aditya Narayan on 10/22/13.
//  Copyright (c) 2013 Aditya Narayan. All rights reserved.
//

#import "ProductViewController.h"

@interface ProductViewController ()



@end

@implementation ProductViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewWillAppear:(BOOL)animated {
    
    [super viewWillAppear:animated];
    
//    if ([self.company.name isEqualToString:@"Apple"]) {
//        self.company.product =[[NSMutableArray alloc]initWithArray: Apple.product];
//    }
//    else if ([self.company.name isEqualToString:@"Google"]){
//        self.products = [[NSMutableArray alloc]initWithArray: self.products2 ];
//    }
//    else if ([self.company.name isEqualToString:@"Tesla"]){
//        self.products = [[NSMutableArray alloc]initWithArray: self.products3 ];
//    }
//    else if ([self.company.name isEqualToString:@"Twitter"]){
//        self.products = [[NSMutableArray alloc]initWithArray: self.products4 ];
//    }
    [self.tableView reloadData];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.company = [[Company alloc]init];
    self.company = self.companyFromView;
    
    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
  
    return [self.company.products count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    cell.imageView.image =  self.company.logo;
    self.product = [[self.company products]objectAtIndex:indexPath.row] ;
    cell.textLabel.text = self.product.name ;
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}



- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [self.products removeObjectAtIndex:indexPath.row];
        
        [self.company.products removeObjectAtIndex:indexPath.row ];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
        [tableView reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
    [self.company.products exchangeObjectAtIndex:fromIndexPath.row withObjectAtIndex:toIndexPath.row];
}


- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}


/*
 #pragma mark - Table view delegate
 
 // In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
 */
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    self.webViewController = [[WebViewController alloc]initWithNibName:@"WebViewController" bundle:nil];
    Product *product = [self.company.products objectAtIndex:indexPath.row];
    self.webViewController.url = product.url;
    [self.navigationController pushViewController:self.webViewController animated:YES];
    [self.webViewController release];
    
}

 
 /*   // Navigation logic may go here, for example:
 // Create the next view controller.
 <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
 
 // Pass the selected object to the new view controller.
 
 // Push the view controller.
 [self.navigationController pushViewController:detailViewController animated:YES];
 }
 
 */

@end
