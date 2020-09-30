//
//  MainViewModel.swift
//  financeApp
//
//  Created by Anton on 9/26/20.
//

import Foundation

class MainViewModel {
    
    enum BalanceActions {
        case increase, decrease
    }
    
    var balance: Double = 98.9
    
    var categories = [Categories]()
    
    init() {
        setupCategories()
    }
    
    private func setupCategories() {
        self.categories.append(Categories(name: "Transport",     image: "car.fill"))
        self.categories.append(Categories(name: "Shopping",      image: "cart"))
        self.categories.append(Categories(name: "Health",        image: "cross"))
        self.categories.append(Categories(name: "Entertainment", image: "gamecontroller"))
        self.categories.append(Categories(name: "Family",        image: "person.3"))
        self.categories.append(Categories(name: "Hobby",         image: "paintbrush.pointed"))
        self.categories.append(Categories(name: "Charity",       image: "gift"))
        self.categories.append(Categories(name: "Education",     image: "book"))
        self.categories.append(Categories(name: "House",         image: "house"))
    }
    
    func changeBalance(action: BalanceActions, on value: String?) {
        if let value = value {
            if let val = Double(value) {
                switch action {
                case .decrease:
                    self.balance -= val
                case .increase:
                    self.balance += val
                }
            }
        }
    }
}
