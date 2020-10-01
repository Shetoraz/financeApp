//
//  AddViewController.swift
//  financeApp
//
//  Created by Anton on 9/27/20.
//

import UIKit

class AddViewController: UIViewController {
    
    private lazy var backdropView: UIView = {
        let bdView             = UIView(frame: self.view.bounds)
        bdView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return bdView
    }()
    
    private let nameLabel    = FNLabel(text: "Add funds")
    private let acceptButton = FNAddButton(title: "Accept")
    private let menuView     = UIView()
    private let shitView     = FNValueInputView(frame: .zero)
    
    private let menuHeight   = UIScreen.main.bounds.height / 4
    private var isPresenting = false
    
    var callback: ((String) -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViews()
        self.addTapGesture()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.modalPresentationStyle = .custom
        self.transitioningDelegate  = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleAcceptTap))
        self.backdropView.addGestureRecognizer(tapGesture)
        self.acceptButton.addTarget(self, action: #selector(handleAcceptTap), for: .touchUpInside)
    }
    
    @objc func handleAcceptTap() {
        guard let value = shitView.amountField.text else { return }
        callback?(value)
        dismiss(animated: true)
    }
    
    private func setupViews() {
        //MARK: - Main View
        self.view.backgroundColor = .clear
        self.view.addSubview(backdropView)
        self.view.addSubview(menuView)
        self.menuView.layer.cornerRadius = 16.0
        self.menuView.backgroundColor                                                    = #colorLiteral(red: 0.01624329016, green: 0.01624945551, blue: 0.01624247618, alpha: 1)
        self.menuView.translatesAutoresizingMaskIntoConstraints                          = false
        self.menuView.heightAnchor.constraint(equalToConstant: self.menuHeight).isActive = true
        self.menuView.anchor(top: nil,
                             leading: view.leadingAnchor,
                             bottom: view.bottomAnchor,
                             trailing: view.trailingAnchor)
        
        //MARK: - Accept Button
        self.menuView.addSubview(acceptButton)
        self.acceptButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.acceptButton.anchor(top: nil,
                                 leading: self.menuView.leadingAnchor,
                                 bottom: self.view.safeAreaLayoutGuide.bottomAnchor,
                                 trailing: self.menuView.trailingAnchor,
                                 padding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16))
        
        //MARK: - Label
        self.menuView.addSubview(nameLabel)
        self.nameLabel.anchorCenterXToSubview(subView: menuView)
        self.nameLabel.anchor(top: self.menuView.safeAreaLayoutGuide.topAnchor,
                              leading: nil,
                              bottom: nil,
                              trailing: nil,
                              padding: UIEdgeInsets(top: 16, left: 0, bottom: 0, right: 0))
        
        //MARK: - Input View
        self.menuView.addSubview(shitView)
        self.shitView.anchor(top: nameLabel.bottomAnchor,
                             leading: menuView.leadingAnchor,
                             bottom: acceptButton.topAnchor,
                             trailing: menuView.trailingAnchor,
                             padding: .init(top: 16, left: 16, bottom: 16, right: 16))
    }
}

extension AddViewController: UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView    = transitionContext.containerView
        let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
        guard let toVC       = toViewController else { return }
        isPresenting         = !isPresenting
        
        if isPresenting == true {
            containerView.addSubview(toVC.view)
            menuView.frame.origin.y += menuHeight
            backdropView.alpha = 0
            
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y -= self.menuHeight
                self.backdropView.alpha = 1
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        } else {
            UIView.animate(withDuration: 0.4, delay: 0, options: [.curveEaseOut], animations: {
                self.menuView.frame.origin.y += self.menuHeight
                self.backdropView.alpha = 0
            }, completion: { (finished) in
                transitionContext.completeTransition(true)
            })
        }
    }
}
