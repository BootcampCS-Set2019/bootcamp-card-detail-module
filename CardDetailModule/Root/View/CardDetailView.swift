//
//  DetailCardView.swift
//  RecommendedCardsModule
//
//  Created by bruno.c.carvalho on 07/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//

import Entities
import Components
import Resources
import Kingfisher

struct CardDetailViewModel {
    var card: Card
}

class CardDetailView: UIView {

    lazy var backgroundImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var cardImage: UIImageView = {
        var imageView = UIImageView()
        imageView.backgroundColor = .clear
        imageView.contentMode = UIImageView.ContentMode.scaleAspectFit
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var closeButton: UIButton = {
        var button = UIButton()
        let imageView = UIImageView()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    public var viewModel: CardDetailViewModel? {
        didSet {
            applyViewModel()
        }
    }

//    lazy var favoriteButton: UIButton = {
//        var button = UIButton()
//        button.backgroundColor = MagicDesignSystem.Colors.clear
//        button.titleLabel?.textColor = MagicDesignSystem.Colors.whiteText
//        button.titleLabel?.font = MagicDesignSystem.Font.systemBold.of(size: 18)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        return button
//    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func applyViewModel() {
        if let urlString = self.viewModel?.card.imageUrl {
            let url = URL(string: urlString)
            self.cardImage.kf.setImage(with: url)
        }
    }
}

extension CardDetailView: ViewCodable {
    func buildHierarchy() {
        self.addSubview(backgroundImage)
        backgroundImage.image = MagicDesignSystem.Assets.background

        self.addSubview(cardImage)
        cardImage.image = MagicDesignSystem.Assets.defaultCardArtboard

        self.addSubview(closeButton)
        closeButton.setImage(MagicDesignSystem.Assets.closeButton, for: .normal)

//        self.addSubview(favoriteButton)
//        favoriteButton.titleLabel?.text = "Add card"
    }

    func buildConstraints() {
        backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true

        cardImage.topAnchor.constraint(equalTo: topAnchor, constant: 150).isActive = true
        cardImage.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
        cardImage.heightAnchor.constraint(equalToConstant: 400).isActive = true
        cardImage.widthAnchor.constraint(equalToConstant: 300).isActive = true

        closeButton.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        closeButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        closeButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        closeButton.widthAnchor.constraint(equalToConstant: 40).isActive = true

//        favoriteButton.topAnchor.constraint(equalTo: cardImage.bottomAnchor, constant: 50).isActive = true
//        favoriteButton.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 0).isActive = true
//        favoriteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
//        favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }

    func configureAdditional() {
    }
}
