//
//  Created by merowing on 08/05/2014.
//
//
//


#import "KZImagePickerBehaviour.h"
#import "UIActionSheet+BlocksKit.h"
#import "KZAsserts.h"

@interface KZImagePickerBehaviour () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@end

@implementation KZImagePickerBehaviour

- (IBAction)pickImageFromButton:(UIButton *)sender
{
  AssertTrueOrReturn(UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPad);

  UIActionSheet *actionSheet = [UIActionSheet bk_actionSheetWithTitle:nil];

  if (self.targetImageView.image) {
    [actionSheet bk_setDestructiveButtonWithTitle:NSLocalizedString(@"Delete photo", nil) handler:^{
      self.targetImageView.image = nil;
    }];
  }

  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] && (self.sourceType == KZImagePickerBehaviourSourceTypeBoth || self.sourceType == KZImagePickerBehaviourSourceTypeCamera)) {
    [actionSheet bk_addButtonWithTitle:NSLocalizedString(@"Take Photo", nil) handler:^{
      [self showPickerWithSourceType:UIImagePickerControllerSourceTypeCamera];
    }];
  }

  if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] && (self.sourceType == KZImagePickerBehaviourSourceTypeBoth || self.sourceType == KZImagePickerBehaviourSourceTypeLibrary)) {
    [actionSheet bk_addButtonWithTitle:NSLocalizedString(@"Choose Existing", nil) handler:^{
      [self showPickerWithSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }];
  }


  [actionSheet bk_setCancelButtonWithTitle:NSLocalizedString(@"Cancel", nil) handler:nil];
  [actionSheet showFromRect:sender.frame inView:sender.superview animated:YES];
}

- (void)showPickerWithSourceType:(UIImagePickerControllerSourceType)sourceType
{
  UIImagePickerController *controller = [UIImagePickerController new];
  controller.modalPresentationStyle = UIModalPresentationCurrentContext;
  controller.sourceType = sourceType;
  controller.delegate = self;

  AssertTrueOrReturn([self.owner isKindOfClass:UIViewController.class]);
  [self.owner presentViewController:controller animated:YES completion:nil];
}

#pragma mark - UIImagePickerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
  UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
  self.targetImageView.image = image;
  [picker dismissViewControllerAnimated:YES completion:nil];

  [self sendActionsForControlEvents:UIControlEventValueChanged];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
  [picker dismissViewControllerAnimated:YES completion:nil];
}


@end