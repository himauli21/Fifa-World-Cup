//
//  ScheduleInterfaceController.swift
//  FIFA WatchKit Extension
//
//  Created by Himauli Patel on 2019-03-09.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import WatchKit
import Foundation
import fifaKit

class ScheduleInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var fifaTable: WKInterfaceTable!
    
    var temp : [Match] = []
    var temp1 : [Match] = []
    var dataHandler = HandlerClass.sharedInstance
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
 
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        temp = dataHandler.getMatchTeam1Array()
        temp1 = dataHandler.getMatchTeam2Array()
       
        // MARK: Populate tableview with data
        self.fifaTable.setNumberOfRows(self.temp.count, withRowType: "fifa_cell")
        
        // loop through array
        // take each item in the array and put it in a table row
        for(i, team1) in self.temp.enumerated()
        {
            let row = self.fifaTable.rowController(at: i) as! ScheduleController
            
            row.team1_name.setText(team1.name)
            row.team1_flag.setImage(team1.flag)
            
            row.date_label.setText(team1.date)
            row.group.setText(team1.group)
            row.start_label.setText(team1.time)
            
        }
        for(i, team2) in self.temp1.enumerated()
        {
            let row = self.fifaTable.rowController(at: i) as! ScheduleController
            
            row.team2_name.setText(team2.name)
            row.team2_flag.setImage(team2.flag)
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
