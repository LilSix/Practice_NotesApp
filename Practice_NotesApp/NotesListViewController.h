//
//  NotesListViewController.h
//  Practice_NotesApp
//
//  Created by YU-CHEN, LIN on 07/05/2017.
//  Copyright © 2017 YU-CHEN, LIN. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NotesListViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableViewWithNotesList;


@end
