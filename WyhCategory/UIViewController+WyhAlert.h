//
//  UIViewController+WyhAlert.h
//  Practice Alert
//
//  Created by wyh on 2017/11/23.
//  Copyright © 2017年 Wyh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^WyhAlertActionBlock)(UIAlertAction * action);

typedef void(^WyhAlertTextFieldStyleBlock)(UITextField *textField);

@interface UIViewController (WyhAlert)

/**
 Quick set and show alertSheet .
 
 @param alertTitle <#alertTitle description#>
 @param alertMessage <#alertMessage description#>
 @param alertTitleBlocks <#alertTitleBlocks description#>
 @param alertActionBlocks <#alertActionBlocks description#>
 @param cancelTitle <#cancelTitle description#>
 @param cancelHandler <#cancelHandler description#>
 */
- (void)showAlertSheetWithTitle:(NSString *)alertTitle
                   AlertMessage:(NSString *)alertMessage
               AlertTitleBlocks:(NSArray <NSString *> *(^)(void))alertTitleBlocks
              AlertActionBlocks:(NSArray <WyhAlertActionBlock> *(^)(void))alertActionBlocks
                    CancelTitle:(NSString *)cancelTitle
                  CancelHandler:(WyhAlertActionBlock)cancelHandler;

/**
 Quick set and show alertView .
 
 @param alertTitle <#alertTitle description#>
 @param alertMessage <#alertMessage description#>
 @param alertTitleBlocks <#alertTitleBlocks description#>
 @param alertActionBlocks <#alertActionBlocks description#>
 @param textFiledStyles <#textFiledStyles description#>
 @param cancelTitle <#cancelTitle description#>
 @param cancelHandler <#cancelHandler description#>
 */
- (void)showAlertViewWithTitle:(NSString *)alertTitle
                  AlertMessage:(NSString *)alertMessage
              AlertTitleBlocks:(NSArray <NSString *> *(^)(void))alertTitleBlocks
             AlertActionBlocks:(NSArray <WyhAlertActionBlock> *(^)(void))alertActionBlocks
          AlertTextFieldStyles:(NSArray<WyhAlertTextFieldStyleBlock> *(^)(void))textFiledStyles
                   CancelTitle:(NSString *)cancelTitle
                 CancelHandler:(WyhAlertActionBlock)cancelHandler;

@end
