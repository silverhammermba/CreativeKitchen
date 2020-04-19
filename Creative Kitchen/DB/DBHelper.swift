//
//  DBHelper.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import CoreData

class DBHelper {
    let container: NSPersistentContainer

    init(container: NSPersistentContainer) {
        self.container = container

        do {
            if let categories = try? container.viewContext.fetch(Category.fetchRequest()), categories.count > 0 {
                print("Yay")
            } else {
                try loadDefaultData()
            }
        } catch {

        }
    }

    func loadDefaultData() throws {
        let context = container.viewContext

        let categories = [
            CategoryViewModel(name: "Cuisine", options: [
                "Italian",
                "Mexican",
                "Romanian",
                "Indian",
                "Chinese",
                "Asian",
                "French",
                "American",
                "Japanese",
                "Mediterranean",
                "Moroccan",
            ]),
            CategoryViewModel(name: "Type of Food", options: [
                "Soup",
                "Stew/curry",
                "Salad",
                "Stir Fry",
                "Caserole/Baked dish",
            ]),
            CategoryViewModel(name: "Protein", options: [
                "Mushrooms",
                "Legumes",
                "Eggs",
                "Seafood",
                "Tofu",
                "\"Meat\"",
                "Cheese/dairy",
            ]),
            CategoryViewModel(name: "Carbs", options: [
                "Noodles",
                "Rice/grains",
                "Potato",
                "Bread",
            ]),
            CategoryViewModel(name: "Greens", options: [
                "Lettuce",
                "Broccoli",
                "Bok Choy",
                "Seaweed",
                "Collard greens",
                "Mustard greens",
                "Brussels sprouts",
                "Green beans",
                "Peas",
                "Spinach",
                "Asparagus",
                "Kale",
                "Argulua",
                "Mixed greens",
                "Cabbage",
            ]),
        ]

        for (i, category) in categories.enumerated() {
            let cat = Category(name: category.name, sortOrder: Int16(i), in: context)
            for option in category.options {
                _ = Option(name: option, category: cat, in: context)
            }
        }

        try context.save()
    }
}
