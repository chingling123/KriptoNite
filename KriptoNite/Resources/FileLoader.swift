//
//  FileLoader.swift
//  KriptoNite
//
//  Created by Erik Nascimento on 10/02/2022.
//

import Foundation
import UIKit

class FileLoader {
    static func loadData() -> Data? {
        do {
            if let bundlePath = Bundle.main.path(forResource: "Masterdata", ofType: "json") {
                return try String(contentsOfFile: bundlePath).data(using: .utf8)
            } else {
                return nil
            }
        } catch {
            return nil
        }
    }
}
