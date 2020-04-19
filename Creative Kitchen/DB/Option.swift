//
//  Option.swift
//  Creative Kitchen
//
//  Created by Maxwell Anselm on 4/18/20.
//  Copyright © 2020 Max. All rights reserved.
//

import CoreData

class Option: NSManagedObject {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Option> {
        return NSFetchRequest<Option>(entityName: String(describing: self))
    }

    @NSManaged public var name: String
    @NSManaged public var category: Category

    convenience init(name: String, category: Category, in context: NSManagedObjectContext) {
        let entity = NSEntityDescription.entity(forEntityName: String(describing: type(of: self)), in: context)!
        self.init(entity: entity, insertInto: context)
        self.name = name
        self.category = category
    }
}
