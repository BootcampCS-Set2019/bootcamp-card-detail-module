//
//  DetailViewController.swift
//  RecommendedCardsModule
//
//  Created by matheus.filipe.bispo on 07/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//
import Entities

class CardDetailViewController: UIViewController {

    let presenter = CardDetailPresenter()
    let mainView = CardDetailView()
    var card: Card

    init(card: Card) {
        self.card = card
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func loadView() {
        self.view = mainView

        mainView.closeButton.addTarget(self, action: #selector(closeView), for: .touchUpInside)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.mainView.viewModel = CardDetailViewModel(card: self.card)
    }

    @objc func closeView() {
        self.dismiss(animated: true)
    }
}
