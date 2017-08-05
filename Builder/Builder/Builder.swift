//
//  Builder.swift
//  Builder
//
//  Created by Snake on 16.07.17.
//  Copyright © 2017 Stanislav Belsky. All rights reserved.
//

import UIKit

protocol Builder{
    
    func stageA()
    func stageB()
    func stageC()
    func getResult() -> Material
    
}
