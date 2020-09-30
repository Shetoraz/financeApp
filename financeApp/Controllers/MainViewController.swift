//
//  MainViewController.swift
//  financeApp
//
//  Created by Anton on 9/22/20.
//

import UIKit

class MainViewController: UIViewController {
    
    let model = MainViewModel()
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(FNCollectionCell.self, forCellWithReuseIdentifier: "mainCell")
        return cv
    }()
    
    let balanceLabel = FNLabel()
    let addButton    = FNAddButton(title: "Add")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addLabel()
        self.setupCollectionView()
        self.setupAddButton()
    }
    
    private func addLabel() {
        self.view.addSubview(balanceLabel)
        self.balanceLabel.anchorCenterXToSubview(subView: view)
        self.balanceLabel.topAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: self.view.safeAreaLayoutGuide.topAnchor, multiplier: 2).isActive = true
        self.balanceLabel.text      = "Balance: \(self.model.balance)$"
    }
    
    private func setupAddButton() {
        self.view.addSubview(addButton)
        self.addButton.anchorCenterXToSubview(subView: view)
        self.addButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.addButton.anchor(top: nil,
                              leading: view.safeAreaLayoutGuide.leadingAnchor,
                              bottom: view.safeAreaLayoutGuide.bottomAnchor,
                              trailing: view.safeAreaLayoutGuide.trailingAnchor,
                              padding: UIEdgeInsets(top: 0, left: 16, bottom: 16, right: 16))
        self.addButton.addTarget(self, action: #selector(showAddMenu), for: .touchUpInside)
    }
    
    @objc func showAddMenu() {
        // FIXME: - Popup
        let vc                    = AddViewController()
        vc.modalPresentationStyle = .custom
        vc.callback = { value in
            self.model.changeBalance(action: .increase, on: value)
            DispatchQueue.main.async {
                self.balanceLabel.text = "Balance: \(self.model.balance)$"
            }
        }
        present(vc, animated: true)
    }
    
    private func setupCollectionView() {
        self.view.addSubview(collectionView)
        self.collectionView.anchor(top: balanceLabel.bottomAnchor,
                                   leading: view.safeAreaLayoutGuide.leadingAnchor,
                                   bottom: view.bottomAnchor,
                                   trailing: view.safeAreaLayoutGuide.trailingAnchor)
        self.collectionView.backgroundColor = .black
        self.collectionView.delegate        = self
        self.collectionView.dataSource      = self
    }
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = collectionView.bounds.width/3.5
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 16,
                            left: 16,
                            bottom: 0,
                            right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as! FNCollectionCell
        let item = self.model.categories[indexPath.row]
        cell.setupCell(text: item.name, image: item.image)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.collectionView.deselectItem(at: indexPath, animated: true)
    }
}
