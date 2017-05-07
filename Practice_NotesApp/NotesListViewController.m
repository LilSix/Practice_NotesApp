//
//  NotesListViewController.m
//  Practice_NotesApp
//
//  Created by YU-CHEN, LIN on 07/05/2017.
//  Copyright © 2017 YU-CHEN, LIN. All rights reserved.
//

#import "NotesListViewController.h"
#import "NoteDetail.h"

@interface NotesListViewController () {
    NSMutableArray *mutableArrayWithNotesList;
}

@end

@implementation NotesListViewController

#pragma mark - View Methods

- (void)viewDidLoad {
    [super viewDidLoad];
    [_tableViewWithNotesList setDelegate:self];
    [_tableViewWithNotesList setDataSource:self];
    [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Init Method

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super initWithCoder:coder];
    if (self) {
        mutableArrayWithNotesList = [NSMutableArray array];
        
        for (int i = 0; i < 6; i++) {
            NoteDetail *noteDetail = [[NoteDetail alloc] init];
            [noteDetail setStringWithNoteDetail:[NSString stringWithFormat:@"New note"]];
            [mutableArrayWithNotesList addObject:noteDetail];
        }
    }
    return self;
}


#pragma mark - EditButtonItem Method

- (void)setEditing:(BOOL)editing animated:(BOOL)animated {
    [super setEditing:editing animated:animated];
    [_tableViewWithNotesList setEditing:editing animated:animated];
}


#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    return [mutableArrayWithNotesList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"Basic"
                                                                     forIndexPath:indexPath];
    NoteDetail *noteDetail = [mutableArrayWithNotesList objectAtIndex:[indexPath row]];
    [[tableViewCell textLabel] setText:[noteDetail stringWithNoteDetail]];
    
    [tableViewCell setShowsReorderControl:YES];
    return tableViewCell;
}


- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [mutableArrayWithNotesList removeObjectAtIndex:[indexPath row]];
        [_tableViewWithNotesList deleteRowsAtIndexPaths:@[indexPath]
                                       withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath {
    NoteDetail *noteDetail = mutableArrayWithNotesList[[sourceIndexPath row]];
    [mutableArrayWithNotesList removeObjectAtIndex:[sourceIndexPath row]];
    [mutableArrayWithNotesList insertObject:noteDetail atIndex:[destinationIndexPath row]];
    
    [tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}


#pragma mark - IBAction Method

- (IBAction)barButtonItemAddTouch:(UIBarButtonItem *)sender {
    NoteDetail *noteDetail = [[NoteDetail alloc] init];
    [noteDetail setStringWithNoteDetail:[NSString stringWithFormat:@"New note"]];
    [mutableArrayWithNotesList addObject:noteDetail];
    
    [_tableViewWithNotesList
        insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[mutableArrayWithNotesList count] - 1
                                                    inSection:0]]
              withRowAnimation:UITableViewRowAnimationAutomatic];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
