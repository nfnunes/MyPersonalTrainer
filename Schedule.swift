//
//  Schedule.swift
//  MyPersonalTrainer
//
//  Created by Nuno on 03/09/2017.
//  Copyright © 2017 Nuno. All rights reserved.
//

import Foundation

class Schedule {
    
    let year = Calendar.current.component(.year, from: Date())
    let month = Calendar.current.component(.month, from: Date())
    let day = Calendar.current.component(.day, from: Date())
    let hour = Calendar.current.component(.hour, from: Date())
    let minute = Calendar.current.component(.minute, from: Date())
}
