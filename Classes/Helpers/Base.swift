//
//  Base.swift
//  OO
//
//  Created by Clinton Johnson on 9/7/18.
//

import Foundation
import UIKit

public class CollectionBaseCell: UICollectionViewCell {
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        OperationOverride()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func OperationOverride() {
        // Implement override code for cells
    }
}


public class TableBaseCell: UITableViewCell {
    override public init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        OperationOverride()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func OperationOverride() {
        // Add any override code here
    }
}
