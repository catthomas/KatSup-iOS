//
//  CompactView.swift
//  cataas
//
//  Created by Thomas, Catherine on 2/24/17.
//  Copyright © 2017 catt. All rights reserved.
//

import Foundation
import UIKit

class CompactView: UIView {
    var delegate: CompactViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        translatesAutoresizingMaskIntoConstraints = false
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(requestExpansion))
        self.addGestureRecognizer(tap)
    }
    
    func requestExpansion() {
        delegate?.expandRequested()
    }
}

protocol CompactViewDelegate {
    func expandRequested()
}

