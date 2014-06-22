//
//  Created by merowing on 22/04/2014.
//
//
//


#import "KZBecomeFirstResponderBehaviour.h"


@implementation KZBecomeFirstResponderBehaviour

- (void)setFirstResponderTarget:(id)firstResponderTarget
{
  _firstResponderTarget = firstResponderTarget;
  [_firstResponderTarget becomeFirstResponder];
}

@end