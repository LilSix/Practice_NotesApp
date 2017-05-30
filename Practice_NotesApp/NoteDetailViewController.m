//
//  NoteDetailViewController.m
//  Practice_NotesApp
//
//  Created by YU-CHEN, LIN on 08/05/2017.
//  Copyright © 2017 YU-CHEN, LIN. All rights reserved.
//

#import "NoteDetailViewController.h"


@interface NoteDetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *textViewNoteContentText;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewNoteContentImage;

@end

@implementation NoteDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_textViewNoteContentText setText:[_noteDetail noteContentString]];
    [_imageViewNoteContentImage setImage:[_noteDetail noteContentImage]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - IBAction

- (IBAction)buttonSaveTouch:(id)sender {
    
    [_noteDetail setNoteContentString:[_textViewNoteContentText text]];
    [_noteDetail setNoteContentImage:[_imageViewNoteContentImage image]];
    
    [[self navigationController] popViewControllerAnimated:YES];
}


//#pragma mark - Navigation
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//
//}


@end
