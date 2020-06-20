//
//  BaseViewController.swift
//  MithranSwiftKit
//
//  Created by MithranN on 29/03/20.
//  Copyright © 2020 MithranN. All rights reserved.
//

import UIKit

open class BaseViewController: UIViewController {
    
    public let tableView: UITableView  = UITableView()
    let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView(style: .medium)
    var apiCallInProgess: Bool = false
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addViews()
        setConstraints()
        setupTableView()
    }
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    
    open func addViews() {
        self.view.addSubview(tableView)
        self.view.addSubview(activityIndicator)
    }
    
    open func setConstraints() {
        self.activityIndicator.center = view.center
    }
    
    open func setupTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.keyboardDismissMode = .onDrag
    }
    
    open func showLoaderForLoadMore() {
        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.frame = CGRect(x: 0.0, y: 0.0, width: tableView.bounds.width, height: 44)
        spinner.startAnimating()
        tableView.tableFooterView = spinner
    }
    
    open func hideLoaderForLoadMore() {
        tableView.tableFooterView = UIView()
    }
    
    
    open func apiCallInProgress() {
        apiCallInProgess = true
        activityIndicator.startAnimating()
        tableView.isHidden = true
    }
    
    open func apiCallCompleted() {
        apiCallInProgess = false
        tableView.isHidden = false
        activityIndicator.stopAnimating()
        hideLoaderForLoadMore()
    }
    
    
    @objc open func keyboardWillAppear(_ notification: NSNotification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            keyboardWillAppear(withKeyboardHeight: keyboardHeight)
        }
    }
    
    open func keyboardWillAppear(withKeyboardHeight: CGFloat) {
        
    }
    
    @objc open func keyboardWillDisappear() {
        
    }
    
} 
