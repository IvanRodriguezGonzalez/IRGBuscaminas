//
//  IRGPreguntarNombreViewController.h
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 9/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IRGDatoDelMejorTiempo.h"
#import "IRGVentanaPrincipalViewController.h"

@interface IRGPreguntarNombreViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>
#pragma mark - Propiedades publicas
@property (nonatomic) IRGDatoDelMejorTiempo *datoDelMejorTiempo;
@property (nonatomic) IRGVentanaPrincipalViewController *sender;
@end
