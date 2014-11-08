//
//  IRGMejoresTiemposViewController.m
//  IRGBuscaminas
//
//  Created by Ivan Rodriguez Gonzalez on 8/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGMejoresTiemposViewController.h"
#import "IRGMejoresTiempos.h"
#import "IRGDatoDelMejorTiempo.h"

@interface IRGMejoresTiemposViewController ()

@end

@implementation IRGMejoresTiemposViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    CGRect frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-60);
    UITableView *tablaDeMejoresTiempos = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    tablaDeMejoresTiempos.dataSource = self;
    [self.view addSubview:tablaDeMejoresTiempos];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark Delegado Primer Nivel
- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    int a =[[IRGMejoresTiempos sharedMejoresTiempos].todosLosMejoresTiempos count];
    return  a;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *celda = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle
                                                   reuseIdentifier:@"UITableViewCell"];
    
    NSInteger filaDeLaTabla  = indexPath.row;
    IRGDatoDelMejorTiempo *mejorTiempo =[IRGMejoresTiempos sharedMejoresTiempos].todosLosMejoresTiempos[filaDeLaTabla];
    
    NSString * detalle = [NSString stringWithFormat:@"Tiempo:%ld Celdas:%ld Minas:%ld",(long)mejorTiempo.tiempo,(long)mejorTiempo.numeroDeCeldas,(long)mejorTiempo.numeroDeMinas];
    
    celda.textLabel.text = mejorTiempo.nombre;
    celda.detailTextLabel.text = detalle;
    
    return celda;
}

@end
