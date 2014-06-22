//
//  Created by merowing on 22/04/2014.
//
//
//


@import Foundation;

#import "KZBehaviour.h"


@interface KZBecomeFirstResponderBehaviour : KZBehaviour
//! object which should become first responder
@property(nonatomic, weak) IBOutlet UIResponder *firstResponderTarget;
@end