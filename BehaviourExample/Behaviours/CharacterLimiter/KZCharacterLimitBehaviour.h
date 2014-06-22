//
//  Created by merowing on 22/04/2014.
//
//
//


@import Foundation;
#import "KZBehaviour.h"

//! Generates UIControlEventValueChanged when character limit is updated
@interface KZCharacterLimitBehaviour : KZBehaviour <UITextViewDelegate>

//! used text view
@property(nonatomic, weak) IBOutlet UITextView *textView;

//! label used to display number of remaining characters
@property(nonatomic, weak) IBOutlet UILabel *counterLabel;

//! max count of characters allowed
@property(nonatomic, assign) NSUInteger maxCount;
@property(nonatomic, assign) BOOL hideKeyboardOnReturn;
@end