//
//  Reminders.swift
//  PetProject
//
//  Created by Georhii Kasilov on 25.02.2021.
//

import Foundation

struct Reminder: Codable {
    var name: String
    var text: String
    var time: String
    let id: String
    
    init(with name: String,
         text: String,
         time: String) {
        self.name = name
        self.text = text
        self.time = time
        self.id = UUID().uuidString
    }
}
