//
//  Array+Identifiable.swift
//  Memorize
//
//  Created by lgy on 2020/11/16.
//  Copyright © 2020 lgy. All rights reserved.
//

import Foundation

extension Array where Element: Identifiable {
        func firstIndex(matching: Element) -> Int {
            for index in 0..<self.count{
                if self[index].id == matching.id {
                    return index
                }
            }
            return 0
        }
}
