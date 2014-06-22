//
//  Created by merowing on 22/04/2014.
//
//
//

#import "KZCharacterLimitBehaviour.h"
#import "KZAsserts.h"

@implementation KZCharacterLimitBehaviour

- (void)awakeFromNib
{
  [super awakeFromNib];
  AssertTrueOrReturn(self.maxCount != 0);
}

- (void)updateCharacterLimit:(NSString *)text
{
  self.counterLabel.text = [@(self.maxCount - text.length) stringValue];
  [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
  if (self.hideKeyboardOnReturn && [text rangeOfCharacterFromSet:[NSCharacterSet newlineCharacterSet]].location != NSNotFound) {
    [textView resignFirstResponder];
    return NO;
  }

  NSString *modifiedText = [textView.text stringByReplacingCharactersInRange:range withString:text];
  const BOOL willModifyText = modifiedText.length <= self.maxCount;
  if (willModifyText) {
    [self updateCharacterLimit:modifiedText];
  }
  return willModifyText;
}

- (void)textViewDidChange:(UITextView *)textView
{
  [self updateCharacterLimit:textView.text];
}

#pragma mark - Helpers
- (void)setTextView:(UITextView *)textView
{
  _textView = textView;
  [self updateCharacterLimit:self.textView.text];
}

- (void)setCounterLabel:(UILabel *)counterLabel
{
  _counterLabel = counterLabel;
  [self updateCharacterLimit:self.textView.text];
}
@end