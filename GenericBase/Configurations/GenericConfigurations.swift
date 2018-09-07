//
//  GenericConfigurations.swift
//  OO
//
//  Created by Clinton Johnson on 9/7/18.
//

import Foundation
import UIKit

public protocol InheritData {
    associatedtype DataType
    
    func configureData(data: DataType)
}

public protocol CellConfigurator {
    static var reuseId: String {get}
    func configureCell(cell: UIView)
}

public class GenericConfigurator<T: InheritData, U>: CellConfigurator where T.DataType == U, T: UIViewController {
    public static var reuseId: String {return String(describing: T.self)}
    
    public let cellItem: U
    public init(cellItem: U) {
        self.cellItem = cellItem
    }
    
    public func configureCell(cell: UIView) {
        (cell as! T).configureData(data: cellItem)
    }
}
