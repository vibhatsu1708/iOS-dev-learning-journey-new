//
//  AllTeamsViewModel.swift
//  FormulaOneEpic
//
//  Created by Vedant Mistry on 28/06/24.
//

import Foundation

class AllTeamsViewModel {
    private(set) var teams: [Team] = [
        Team(
            id: .Ferrari,
            name: "Ferrari",
            image: "Ferrari",
            worldTitlesWon: 16,
            teamPrincipal: "Fred Vasseur",
            drivers: ["Charles Leclerc", "Carlos Sainz"],
            description: "Scuderia Ferrari is the racing team division of the Ferrari automobile marque."
        ),
        Team(
            id: .RedBull,
            name: "RedBull",
            image: "RedBull",
            worldTitlesWon: 5,
            teamPrincipal: "Christian Horner",
            drivers: ["Max Verstappen", "Sergio Perez"],
            description: "Red Bull Racing is a Formula One racing team, racing under an Austrian licence."
        ),
        Team(
            id: .Mercedes,
            name: "Mercedes",
            image: "Mercedes",
            worldTitlesWon: 8,
            teamPrincipal: "Toto Wolff",
            drivers: ["Lewis Hamilton", "George Russell"],
            description: "Mercedes-AMG Petronas Formula One Team is the Formula One racing team of Mercedes-Benz."
        ),
        Team(
            id: .Mclaren,
            name: "Mclaren",
            image: "Mclaren",
            worldTitlesWon: 8,
            teamPrincipal: "Andrea Stella",
            drivers: ["Lando Norris", "Oscar Piastri"],
            description: "McLaren Racing Limited is a British motor racing team based at the McLaren Technology Centre."
        ),
        Team(
            id: .AstonMartin,
            name: "AstonMartin",
            image: "AstonMartin",
            worldTitlesWon: 0,
            teamPrincipal: "Mike Krack",
            drivers: ["Fernando Alonso", "Lance Stroll"],
            description: "Aston Martin Cognizant Formula One Team is a British manufacturer of luxury sports cars and grand tourers."
        ),
        Team(
            id: .RacingBulls,
            name: "RacingBulls",
            image: "RacingBulls",
            worldTitlesWon: 0,
            teamPrincipal: "Laurent Mekies",
            drivers: ["Yuki Tsunoda", "Daniel Ricciardo"],
            description: "Scuderia AlphaTauri is an Italian Formula One racing team and constructor."
        ),
        Team(
            id: .StakeSauber,
            name: "StakeSauber",
            image: "StakeSauber",
            worldTitlesWon: 0,
            teamPrincipal: "Alessandro Alunni Bravi",
            drivers: ["Valtteri Bottas", "Zhou Guanyu"],
            description: "Sauber Motorsport AG is a Swiss motorsport engineering company."
        ),
        Team(
            id: .Haas,
            name: "Haas",
            image: "Haas",
            worldTitlesWon: 0,
            teamPrincipal: "Ayao Komatsu",
            drivers: ["Kevin Magnussen", "Nico Hulkenberg"],
            description: "Haas F1 Team is an American Formula One racing team established by NASCAR Cup Series team co-owner Gene Haas."
        ),
        Team(
            id: .Williams,
            name: "Williams",
            image: "Williams",
            worldTitlesWon: 9,
            teamPrincipal: "James Vowles",
            drivers: ["Alexander Albon", "Logan Sargeant"],
            description: "Williams Grand Prix Engineering Limited is a British Formula One motor racing team and constructor."
        ),
        Team(
            id: .Alpine,
            name: "Alpine",
            image: "Alpine",
            worldTitlesWon: 2,
            teamPrincipal: "Otmar Szafnauer",
            drivers: ["Esteban Ocon", "Pierre Gasly"],
            description: "Alpine F1 Team is a Formula One constructor which made its debut in the 2021 Formula One World Championship."
        )
    ]
}
