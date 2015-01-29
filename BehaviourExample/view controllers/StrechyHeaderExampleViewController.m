//
//  StrechyHeaderExampleViewController.m
//  BehaviourExample
//
//  Created by Michal Zygar on 29.01.2015.
//  Copyright (c) 2015 pixle. All rights reserved.
//

#import "StrechyHeaderExampleViewController.h"
NSString* const cellIdentifier=@"cell";
@interface StrechyHeaderExampleViewController ()

@end

@implementation StrechyHeaderExampleViewController

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
}
@end
