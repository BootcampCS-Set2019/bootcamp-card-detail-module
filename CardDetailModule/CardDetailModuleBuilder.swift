//
//  CardDetailModuleBuilder.swift
//  CardDetailModule
//
//  Created by matheus.filipe.bispo on 09/10/19.
//  Copyright © 2019 BootcampCS-Set2019. All rights reserved.
//

import Entities

public class CardDetailModuleBuilder {
    public static func buildRoot(card: Card) -> CardDetailViewController {
        return CardDetailViewController(card: card)
    }
}
