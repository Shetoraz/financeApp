//
//  MainViewModel.swift
//  financeApp
//
//  Created by Anton on 9/26/20.
//

import Foundation

class FNMainViewModel {
    
    enum BalanceActions {
        case increase, decrease
    }
    
    var balance: Double = 0.0
    
    var categories = [FNCategories]()
    
    init() {
        setupCategories()
    }
    
    private func setupCategories() {
        self.categories.append(FNCategories(name: "Transport",     image: "car.fill",           moneySpent: 0.0))
        self.categories.append(FNCategories(name: "Shopping",      image: "cart",               moneySpent: 0.0))
        self.categories.append(FNCategories(name: "Health",        image: "cross",              moneySpent: 0.0))
        self.categories.append(FNCategories(name: "Entertainment", image: "gamecontroller",     moneySpent: 0.0))
        self.categories.append(FNCategories(name: "Family",        image: "person.3",           moneySpent: 0.0))
        self.categories.append(FNCategories(name: "Hobby",         image: "paintbrush.pointed", moneySpent: 0.0))
        self.categories.append(FNCategories(name: "Charity",       image: "gift",               moneySpent: 0.0))
        self.categories.append(FNCategories(name: "Education",     image: "book",               moneySpent: 0.0))
        self.categories.append(FNCategories(name: "House",         image: "house", 	            moneySpent: 0.0))
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
    func addSpentMoneyToCategory(category: FNCategories, on value: String?) {
        if let value = value {
            if let val = Double(value) {
                category.moneySpent += val
            }
        }
    }
}
