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
    
    var balance: Double = 0.0
    
    var categories = [Categories]()
    
    init() {
        setupCategories()
    }
    
    private func setupCategories() {
        self.categories.append(Categories(name: "Transport",     image: "car.fill",           moneySpent: 0.0))
        self.categories.append(Categories(name: "Shopping",      image: "cart",               moneySpent: 0.0))
        self.categories.append(Categories(name: "Health",        image: "cross",              moneySpent: 0.0))
        self.categories.append(Categories(name: "Entertainment", image: "gamecontroller",     moneySpent: 0.0))
        self.categories.append(Categories(name: "Family",        image: "person.3",           moneySpent: 0.0))
        self.categories.append(Categories(name: "Hobby",         image: "paintbrush.pointed", moneySpent: 0.0))
        self.categories.append(Categories(name: "Charity",       image: "gift",               moneySpent: 0.0))
        self.categories.append(Categories(name: "Education",     image: "book",               moneySpent: 0.0))
        self.categories.append(Categories(name: "House",         image: "house", 	          moneySpent: 0.0))
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
    
    //FIXME: - Can't use money if balance < 0!
    func addSpentMoneyToCategory(category: Categories, on value: String?) {
        if let value = value {
            if let val = Double(value) {
                category.moneySpent += val
            }
        }
    }
}
