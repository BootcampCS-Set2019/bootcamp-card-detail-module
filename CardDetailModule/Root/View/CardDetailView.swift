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
import SnapKit

public struct CardDetailViewModel {
    var card: Card
}

public class CardDetailView: UIView {

    lazy var backgroundImage: UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.accessibilityIdentifier = MagicDesignSystem
            .AccessibilityIdentifiers(componentType: .imageView,
                                      additionalName: "Background",
                                      module: .cardDetail,
                                      number: nil)
            .constructedName
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
        button.accessibilityIdentifier = MagicDesignSystem
            .AccessibilityIdentifiers(componentType: .button,
                                      additionalName: "Close",
                                      module: .cardDetail,
                                      number: nil)
            .constructedName
        return button
    }()

    public var viewModel: CardDetailViewModel? {
        didSet {
            applyViewModel()
        }
    }

    lazy var favoriteButton: UIButton = {
        var button = MagicDesignSystem.Buttons.bottomHorizontalLarge.uiButton(text: "Add card")
        button.backgroundColor = MagicDesignSystem.Colors.clear
        button.titleLabel?.textColor = MagicDesignSystem.Colors.whiteText
        button.titleLabel?.font = MagicDesignSystem.Font.systemBold.of(size: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.accessibilityIdentifier = MagicDesignSystem
            .AccessibilityIdentifiers(componentType: .button,
                                      additionalName: "Favorite",
                                      module: .cardDetail,
                                      number: nil)
            .constructedName
        return button
    }()

    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func applyViewModel() {
        guard let viewModelAux = viewModel else {
            return
        }
        guard let imageUrl = viewModelAux.card.imageUrl else {
            return
        }
        let url = URL(string: imageUrl)
        self.cardImage.kf.setImage(with: url)
        self.cardImage.accessibilityIdentifier = MagicDesignSystem
            .AccessibilityIdentifiers(componentType: .imageView,
                                      additionalName: nil,
                                      module: .cardDetail,
                                      number: nil)
            .constructedName

    }
}

extension CardDetailView: ViewCodable {
    public func buildHierarchy() {
        self.addSubview(backgroundImage)
        backgroundImage.image = MagicDesignSystem.Assets.background

        self.addSubview(cardImage)
        cardImage.image = MagicDesignSystem.Assets.defaultCardArtboard

        self.addSubview(closeButton)
        closeButton.setImage(MagicDesignSystem.Assets.closeButton, for: .normal)

        self.addSubview(favoriteButton)
    }

    public func buildConstraints() {
        let screenSize = UIScreen.main.bounds.size

        self.backgroundImage.snp.makeConstraints { (maker) in
            maker.top.bottom.left.right.equalToSuperview()
        }

        self.cardImage.snp.makeConstraints { (maker) in
            maker.width.equalTo(20 * screenSize.width / 33)
            maker.height.equalTo(screenSize.height / 2)
            maker.centerX.equalTo(self.snp.centerX)
            maker.centerY.equalTo(self.snp.centerY)
        }

        self.closeButton.snp.makeConstraints { (maker) in
            maker.top.equalTo(self.snp.top).offset(40)
            maker.left.equalTo(self.snp.left).offset(20)
            maker.width.equalTo(40)
            maker.height.equalTo(40)
        }

        self.favoriteButton.snp.makeConstraints { (maker) in
            maker.bottom.equalTo(self.snp.bottom).offset(-20)
            maker.left.equalTo(self.snp.left).offset(20)
            maker.right.equalTo(self.snp.right).offset(-20)
            maker.height.equalTo(50)
        }
    }

    public func configureAdditional() {
    }
}
