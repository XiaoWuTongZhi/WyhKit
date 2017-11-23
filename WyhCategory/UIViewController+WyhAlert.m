//
//  UIViewController+WyhAlert.m
//  Practice Alert
//
//  Created by wyh on 2017/11/23.
//  Copyright © 2017年 Wyh. All rights reserved.
//

#import "UIViewController+WyhAlert.h"

@implementation UIViewController (WyhAlert)

- (void)showAlertSheetWithTitle:(NSString *)alertTitle
                   AlertMessage:(NSString *)alertMessage
               AlertTitleBlocks:(NSArray <NSString *> *(^)(void))alertTitleBlocks
              AlertActionBlocks:(NSArray <WyhAlertActionBlock> *(^)(void))alertActionBlocks
                    CancelTitle:(NSString *)cancelTitle
                  CancelHandler:(WyhAlertActionBlock)cancelHandler {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleActionSheet];
    
    if (alertTitleBlocks) {
        
        [alertTitleBlocks() enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj != nil) {
                
                WyhAlertActionBlock currentActionblock = nil;
                NSArray *alertActions = @[];
                if (alertActionBlocks) {
                    alertActions = alertActionBlocks();
                }
                
                if ([alertActions count] > idx) {
                    currentActionblock = alertActions[idx];
                }
                
                UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:(UIAlertActionStyleDefault) handler:currentActionblock];
                [alertVC addAction:action];
            }
        }];
    }
    
    if (cancelTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancelHandler];
        [alertVC addAction:cancelAction];
    }
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}

- (void)showAlertViewWithTitle:(NSString *)alertTitle
                  AlertMessage:(NSString *)alertMessage
              AlertTitleBlocks:(NSArray <NSString *> *(^)(void))alertTitleBlocks
             AlertActionBlocks:(NSArray <WyhAlertActionBlock> *(^)(void))alertActionBlocks
          AlertTextFieldStyles:(NSArray<WyhAlertTextFieldStyleBlock> *(^)(void))textFiledStyles
                   CancelTitle:(NSString *)cancelTitle
                 CancelHandler:(WyhAlertActionBlock)cancelHandler {
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:alertTitle message:alertMessage preferredStyle:UIAlertControllerStyleAlert];
    
    if (alertTitleBlocks) {
        
        [alertTitleBlocks() enumerateObjectsUsingBlock:^(NSString * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if (obj != nil) {
                
                WyhAlertActionBlock currentActionblock = nil;
                NSArray *alertActions = @[];
                if (alertActionBlocks) {
                    alertActions = alertActionBlocks();
                }
                
                if ([alertActions count] > idx) {
                    currentActionblock = alertActions[idx];
                }
                
                UIAlertAction *action = [UIAlertAction actionWithTitle:obj style:(UIAlertActionStyleDefault) handler:currentActionblock];
                [alertVC addAction:action];
            }
        }];
    }
    
    if (textFiledStyles) {
        [textFiledStyles() enumerateObjectsUsingBlock:^(WyhAlertTextFieldStyleBlock  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            [alertVC addTextFieldWithConfigurationHandler:obj];
        }];
    }
    
    if (cancelTitle) {
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:cancelTitle style:UIAlertActionStyleCancel handler:cancelHandler];
        [alertVC addAction:cancelAction];
    }
    
    [self presentViewController:alertVC animated:YES completion:nil];
}

@end
