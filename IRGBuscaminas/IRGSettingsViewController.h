//
//  IRGSettingsViewController.h
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 17/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRGVentanaPrincipalViewController.h"

@interface IRGSettingsViewController : UIViewController
#pragma mark - Propiedades publicas
@property (nonatomic) IRGVentanaPrincipalViewController *senderViewController;
@property (weak, nonatomic) IBOutlet UIView *vistaDatos;


@end
