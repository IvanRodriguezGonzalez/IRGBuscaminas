//
//  IRGVistaConPorcentajeDeAvance.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 18/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGVistaConPorcentajeDeAvance.h"
@interface IRGVistaConPorcentajeDeAvance()
@end

@implementation IRGVistaConPorcentajeDeAvance

- (void)drawRect:(CGRect)rect {

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                        radius:self.frame.size.width/2-5
                                                    startAngle:0
                                                      endAngle:2*3.14
                                                     clockwise:true];
    [[UIColor lightGrayColor] setStroke];
    path.lineWidth =7;
    [path stroke];
  
    
    path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                          radius:self.frame.size.width/2-5
                                      startAngle:0
                                        endAngle:2*3.14*self.porcentajeDeAvance
                                       clockwise:true];
    [[UIColor blackColor] setStroke];
    path.lineWidth = 7;
    [path stroke];
    
    path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(self.frame.size.width/2, self.frame.size.height/2)
                                                        radius:self.frame.size.width/2-5
                                                    startAngle:0
                                                      endAngle:2*3.14*self.porcentajeDeAvance
                                                     clockwise:true];
    [[UIColor blueColor] setStroke];
    path.lineWidth = 5;
    [path stroke];

}

-(void) setPorcentajeDeAvance:(float)porcentajeDeAvance{
    _porcentajeDeAvance = porcentajeDeAvance;
}
@end;

