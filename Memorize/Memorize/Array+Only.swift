//
//  Array+Only.swift
//  Memorize
//
//  Created by lgy on 2020/11/17.
//  Copyright © 2020 lgy. All rights reserved.
//

import Foundation


extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
