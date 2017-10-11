//
//  timeSlotClass.swift
//  scanR
//
//  Created by Ashton Lye on 11/10/17.
//  Copyright © 2017 Shwifty. All rights reserved.
//

import Foundation

//for reference, timeslot array looks like this:
//Id = int64
//Day = int
//Hour = int
//DurationMinutes = int
//ClassName = Str
//PaperName = Str
//ClassType = Str
//StudentId = int64

//issue 7 - Ashton
//I know what you're thinking, why not just use the array returned by the API request?
//The answer is, I don't really know. I tried to use the UserDefaults framework originally but that doesn't work for arrays of objects.
//So I tried following the tutorial on saving arrays of objects in the book but it doesn't seem to work the same way here as it did there.
//It's also very late and I'm very tired so I'm calling it. Hopefully I can still get some marks for being halfway there? (And my bug fix of course 😀)
class timeSlotClass:Codable {
    struct timeSlot {
        var id: Int
        var day: Int
        var hour: Int
        var durationMinutes: Int
        var className: String
        var paperName: String
        var classType: String
        var studentId: Int
    }

    var tsArray = [timeSlot]()
    
    func createTimeslot(id: Int, day: Int, hour: Int, durationMinutes: Int, className: String, paperName: String, classType: String, studentId: Int) {
        let newTimeslot = timeSlotClass.timeSlot(id: id, day: day, hour: hour, durationMinutes: durationMinutes, className: className, paperName: paperName, classType: classType, studentId: studentId)
        tsArray.append(newTimeslot)
    }
    
    
    let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    let archiveURL = documentsDirectory.appendingPathComponent("timeslotData").appendingPathExtension("plist")
    
    func encode(to encoder: Encoder) throws {
        let propertyListEncoder = PropertyListEncoder()
        let encodedTimeslots = try? propertyListEncoder.encode(tsArray)
        
        try? encodedTimeslots?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func decode(from decoder: Decoder) throws {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedTimeslotData = try? Data(contentsOf: archiveURL),
            let decodedTimeslots = try? propertyListDecoder.decode(Array<timeSlot>.self, from: retrievedTimeslotData) {
            print(decodedTimeslots)
        }
    }



    

}
