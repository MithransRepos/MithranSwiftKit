//
//  BaseTableViewCell.swift
//  MithranSwiftKit
//
//  Created by MithranN on 11/12/19.
//  Copyright © 2020 MithranN. All rights reserved.
//

import UIKit
open class BaseTableViewCell: UITableViewCell, ReuseIdentifying {
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addViews()
        setConstraints()
    }
    
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func addViews() {}
    
    open func setConstraints() {}
    
}


public protocol ReuseIdentifying {
    static var reuseIdentifier: String { get }
}


extension ReuseIdentifying {
    public static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
