//
//  IRGMejoresTiemposViewController.h
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IRGMejoresTiemposViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>


-(instancetype) initWithNibName:(NSString *)nibNameOrNil
                         bundle:(NSBundle *)nibBundleOrNil
                          nivel:(NSInteger)nivel;

- (void) cerrarVentana;

@end
