//
//  DropDownViewController.swift
//  firenspec
//
//  Created by David Seek on 12/28/17.
//  Copyright © 2017 David Seek. All rights reserved.
//

import UIKit


class DropDownViewController: UIViewController {

    
    @IBOutlet weak var _backgroundView: UIView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableViewHeightConstraint: NSLayoutConstraint!
    
    var dataProvider: DropDownDataProvider
    var isPresenting: Bool = false
    var manager: DropDownManager
    
    init(dataProvider: DropDownDataProvider) {
        
        guard dataProvider.data.count > 1 else {
            fatalError("Data count needs to be at least 2 to provide a selection.")
        }
        
        self.dataProvider = dataProvider
        self.manager = DropDownManager(dataCount: self.dataProvider.data.count)
        super.init(nibName: "DropDownViewController", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableViewHeightConstraint.constant = self.manager.getDesiredTableViewHeight()
        
        self.tableView.register(UINib(nibName: "DropDownCell", bundle: nil), forCellReuseIdentifier: "dropDownCell")
        self.tableView.register(UINib(nibName: "DropDownHeader", bundle: nil), forCellReuseIdentifier: "dropDownHeader")
        self.tableView.dataSource = self.dataProvider
        self.tableView.delegate = self.dataProvider
        self.tableView.tableFooterView = UIView()
        self.tableView.rowHeight = 50
        self.tableView.backgroundColor = self.dataProvider.style.controllerBackgroundColor
        self.tableView.bounces = self.dataProvider.data.count > 6
        self.tableView.separatorStyle = .none
        self.tableView.reloadData()
        
        self.view.backgroundColor = .clear
        self._backgroundView.backgroundColor = self.dataProvider.style.controllerBackgroundColor
    }
    
    open func present(on controller: UIViewController) {
        
        self.modalPresentationStyle = .overCurrentContext
        self.transitioningDelegate = self
        controller.present(self, animated: true) {}
    }
}

// MARK: - CUSTOM TRANSITION
extension DropDownViewController: UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        
        return 0.3
    }
    
    private func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.isPresenting = true
        return self
    }
    
    internal override func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        
        self.isPresenting = false
        return self
    }
    
    internal func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if self.isPresenting {
            
            self.animatePresentation(with: transitionContext)
            
        } else {
            
            self.animateDismissal(with: transitionContext)
        }
    }
    
    func animatePresentation(with context: UIViewControllerContextTransitioning) {
        
        guard let controller = context.viewController(forKey: .to) as? DropDownViewController else {
            return
        }
        
        guard let view = context.view(forKey: .to) else {
            return
        }
        
        let containerView = context.containerView
        
        view.frame = context.finalFrame(for: controller)
        controller.view.alpha = 1
        controller._backgroundView.alpha = 0
        self.tableViewHeightConstraint.constant = 0
        
        containerView.addSubview(view)
        
        self.animate(animations: {

            self.tableViewHeightConstraint.constant = self.manager.getDesiredTableViewHeight()
            controller._backgroundView.alpha = 1
            view.layoutIfNeeded()
            
        }) { completed in
            
            context.completeTransition(completed)
        }
    }
    
    func animateDismissal(with context: UIViewControllerContextTransitioning) {

        guard let view = context.view(forKey: .from) else {
            return
        }
        
        self.animate(animations: {
            
            self.tableViewHeightConstraint.constant = 0
            view.layoutIfNeeded()
            view.alpha = 0
            
        }) { completed in
            
            context.completeTransition(completed)
        }
    }
    
    func animate(animations: @escaping () -> Void, completion: @escaping (Bool) -> Void) {
        
        UIView.animate(
            
            withDuration: 0.3,
            delay: 0.0,
            usingSpringWithDamping: 2,
            initialSpringVelocity: 0.0,
            options: .allowUserInteraction,
            animations: {
                
                animations()
                
        }) { completed in
            
            completion(completed)
        }
    }
}
