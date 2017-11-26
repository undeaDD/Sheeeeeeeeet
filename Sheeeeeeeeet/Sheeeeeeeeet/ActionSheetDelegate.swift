//
//  ActionSheetDelegate.swift
//  Sheeeeeeeeet
//
//  Created by Saidi Daniel (BookBeat) on 2017-11-24.
//  Copyright © 2017 Daniel Saidi. All rights reserved.
//

import UIKit

open class ActionSheetDelegate: NSObject, UITableViewDelegate {
    
    
    // MARK: - Initialization
    
    init(actionSheet: ActionSheet, selectAction: @escaping (ActionSheetItem) -> ()) {
        self.actionSheet = actionSheet
        self.selectAction = selectAction
    }
    
    
    // MARK: - Properties
    
    fileprivate weak var actionSheet: ActionSheet?
    
    fileprivate let selectAction: (ActionSheetItem) -> ()
    
    
    // MARK: - UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let item = actionSheet?.item(at: indexPath) else { return 0 }
        return CGFloat(item.height)
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let item = actionSheet?.item(at: indexPath) else { return }
        tableView.deselectRow(at: indexPath, animated: true)
        print("SeHELECT")
        selectAction(item)
        /*delegate?.actionSheet(self, didSelect: item(at: indexPath), at: indexPath)
        if dismissStyle == .auto {
            dismiss()
        }*/
    }
}

