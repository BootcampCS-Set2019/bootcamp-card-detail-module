//
//  DetailViewController.swift
//  RecommendedCardsModule
//
//  Created by matheus.filipe.bispo on 07/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//
import Entities

public protocol CardDetailControllerDelegate: class {
    func didFavoriteButtonWasTapped(card: Card)
}

public class CardDetailViewController: UIViewController {

    private let presenter = CardDetailPresenter()
    private let mainView = CardDetailView()
    private var card: Card

    public weak var delegate: CardDetailControllerDelegate?

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
        mainView.favoriteButton.addTarget(self, action: #selector(favoriteButton), for: .touchUpInside)
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        self.mainView.viewModel = CardDetailViewModel(card: self.card)
    }

    @objc func closeView() {
        self.dismiss(animated: true)
    }

    @objc func favoriteButton() {
        delegate?.didFavoriteButtonWasTapped(card: card)
    }
}
