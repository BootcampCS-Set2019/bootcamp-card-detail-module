//
//  CardDetailModuleBuilder.swift
//  CardDetailModule
//
//  Created by matheus.filipe.bispo on 09/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//

import Entities

public class RecommendedCardsModuleBuilder {
    public static func buildRoot(card: Card) -> UIViewController {
        return CardDetailViewController(card: card)
    }
}
