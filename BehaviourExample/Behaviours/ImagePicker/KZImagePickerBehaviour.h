//
//  Created by merowing on 08/05/2014.
//
//
//


@import Foundation;

#import "KZBehaviour.h"

//! obviously NS_OPTIONS would be better, but it's harder to expose that in XIB
typedef NS_ENUM(NSUInteger, KZImagePickerBehaviourSourceType) {
  KZImagePickerBehaviourSourceTypeBoth = 0,
  KZImagePickerBehaviourSourceTypeCamera = 1,
  KZImagePickerBehaviourSourceTypeLibrary = 2,
};

//! Generates UIControlEventValueChanged when image is selected
@interface KZImagePickerBehaviour : KZBehaviour
//! source type to use
@property(nonatomic, assign) IBInspectable NSInteger sourceType;

//! image view to assign selected image to
@property(nonatomic, weak) IBOutlet UIImageView *targetImageView;

- (IBAction)pickImageFromButton:(UIButton *)sender;
@end