//
//  NotesListViewController.m
//  Practice_NotesApp
//
//  Created by YU-CHEN, LIN on 07/05/2017.
//  Copyright © 2017 YU-CHEN, LIN. All rights reserved.
//

#import "NotesListViewController.h"
#import "NoteDetail.h"
#import "NoteDetailViewController.h"

@interface NotesListViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *mutableArrayNotesList;
}

@property (weak, nonatomic) IBOutlet UITableView *tableViewNotesList;

@end

@implementation NotesListViewController

#pragma mark -

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [_tableViewNotesList setDelegate:self];
    [_tableViewNotesList setDataSource:self];
    [[self navigationItem] setLeftBarButtonItem:[self editButtonItem]];
}


- (void)viewWillAppear:(BOOL)animated {
    
    [_tableViewNotesList reloadData];
}

- (void)didReceiveMemoryWarning {
    
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Init

- (instancetype)initWithCoder:(NSCoder *)coder {
    
    self = [super initWithCoder:coder];
    if (self) {
        
        mutableArrayNotesList = [NSMutableArray array];
        
        for (int i = 0; i < 6; i++) {
            
            NoteDetail *noteDetail = [[NoteDetail alloc] init];
            [noteDetail setNoteContentString:[NSString stringWithFormat:@"New note"]];
            [mutableArrayNotesList addObject:noteDetail];
        }
    }
    
    return self;
}


#pragma mark - EditButtonItem

- (void)setEditing:(BOOL)editing
          animated:(BOOL)animated {
    
    [super setEditing:editing animated:animated];
    [_tableViewNotesList setEditing:editing animated:animated];
}


#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    
    return [mutableArrayNotesList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *tableViewCell = [tableView dequeueReusableCellWithIdentifier:@"Basic Cell"
                                                                     forIndexPath:indexPath];
    NoteDetail *noteDetail = [mutableArrayNotesList objectAtIndex:[indexPath row]];
    [[tableViewCell textLabel] setText:[noteDetail noteContentString]];
    
    [tableViewCell setShowsReorderControl:YES];
    
    return tableViewCell;
}


- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
 forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [mutableArrayNotesList removeObjectAtIndex:[indexPath row]];
        [_tableViewNotesList deleteRowsAtIndexPaths:@[indexPath] 
                                   withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}


- (void)tableView:(UITableView *)tableView
moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath
       toIndexPath:(NSIndexPath *)destinationIndexPath {
    
    NoteDetail *noteDetail = mutableArrayNotesList[[sourceIndexPath row]];
    [mutableArrayNotesList removeObjectAtIndex:[sourceIndexPath row]];
    [mutableArrayNotesList insertObject:noteDetail atIndex:[destinationIndexPath row]];
    
    [tableView moveRowAtIndexPath:sourceIndexPath toIndexPath:destinationIndexPath];
}


#pragma mark - IBAction

- (IBAction)barButtonItemAddTouch:(UIBarButtonItem *)sender {
    
    NoteDetail *noteDetail = [[NoteDetail alloc] init];
    [noteDetail setNoteContentString:[NSString stringWithFormat:@"New note"]];
    [mutableArrayNotesList addObject:noteDetail];
    
    [_tableViewNotesList insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:[mutableArrayNotesList count] - 1
                                                                     inSection:0]]
                               withRowAnimation:UITableViewRowAnimationAutomatic];
}


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    if ([[segue identifier] isEqualToString:@"segueShowToNoteDetailView"]) {
        
        NoteDetailViewController *noteDetailViewControlloer = [segue destinationViewController];
        NSIndexPath *indexPath = [_tableViewNotesList indexPathForSelectedRow];
        NoteDetail *noteDetail = mutableArrayNotesList[[indexPath row]];
        [noteDetailViewControlloer setNoteDetail:noteDetail];
    }
}

@end
