//
//  PersonalIteractor.swift
//  test task
//
//  Created by Даниил Пасилецкий on 03.03.2022.
//

import Foundation

protocol PersonalIteractorProtocol: class {
    func addChildren()
    func delChild()
}

class PersonalIteractor: PersonalIteractorProtocol {
    func delChild() {
        if (countChildren == 5){
            presenter.yesNewChild()
        }
        countChildren -= 1
    }
    var countChildren = 0
    func addChildren() {
        presenter.ClearDisActive()
        countChildren += 1
        if (countChildren == 5){
            presenter.NoNewChild()
        }
        presenter.addNewChildren()
            presenter.ClearActive()
        
    }
    
    
    weak var presenter: PersonalPresenterProtocol!
    
    required init(presenter: PersonalPresenterProtocol) {
            self.presenter = presenter
        }
}
