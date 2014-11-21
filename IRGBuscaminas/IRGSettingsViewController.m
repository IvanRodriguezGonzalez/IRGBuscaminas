//
//  IRGSettingsViewController.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 17/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSettingsViewController.h"
#import "IRGSettings.h"

@interface IRGSettingsViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numeroDeMinas;
@property (weak, nonatomic) IBOutlet UITextField *tiempoDeAyuda;
@property (weak, nonatomic) IBOutlet UISegmentedControl *activarAyuda;

@end

@implementation IRGSettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (IBAction)guardarResultados:(UIButton *)sender {
    [IRGSettings sharedSettings].numeroDeMinas = self.numeroDeMinas.text.integerValue;
    [IRGSettings sharedSettings].tiempoDeAyuda = self.tiempoDeAyuda.text.integerValue;
    if (self.activarAyuda.selectedSegmentIndex == 0){
    [IRGSettings sharedSettings].activarAyuda  = true ;
    }
    else {
        [IRGSettings sharedSettings].activarAyuda  = false ;

    }
}

@end
