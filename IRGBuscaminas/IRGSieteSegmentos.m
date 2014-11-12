//
//  IRGSieteSegmentos.m
//  IRGBuscaminas
//
//  Created by Leticia Vila Sexto on 12/11/14.
//  Copyright (c) 2014 Ivan Rodriguez Gonzalez. All rights reserved.
//

#import "IRGSieteSegmentos.h"
#import  "IRGNUmeroSieteSegmentosViewController.h"

@interface IRGSieteSegmentos ()

@property (nonatomic) IRGNUmeroSieteSegmentosViewController * delegado;
@end

@implementation IRGSieteSegmentos


-(instancetype) initWithFrame:(CGRect)frame{
    return [self initWithFrame:frame
                      delegado:nil];
}

//designated initializer
- (instancetype) initWithFrame:(CGRect)frame
                      delegado:(IRGNUmeroSieteSegmentosViewController *)sender{
    self = [super init];
    if (self) {
        _delegado = sender;
    }
    return self;
}

#pragma mark - Overrides
- (void)drawRect:(CGRect)rect {
    [self.delegado dibujarNumero:self];
}


@end
