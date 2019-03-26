//
//  SubscriptionInterfaceController.swift
//  FIFA WatchKit Extension
//
//  Created by Himauli Patel on 2019-03-10.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity
import fifaKit

class SubscriptionInterfaceController: WKInterfaceController, WCSessionDelegate {
   
 func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
    
    }

    @IBOutlet weak var subscriptionTable: WKInterfaceTable!
    
    @IBOutlet weak var noSub: WKInterfaceLabel!
    
    var temp : [Match] = []
    var temp1 : [Match] = []
    var arr:[String]?
    var dataHandler = HandlerClass.sharedInstance
    var subscribedGames:[String] = []
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        if WCSession.isSupported() {
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func session(_ session: WCSession, didReceiveMessage message: [String : Any]) {
        // Play a "click" sound when you get the message
        WKInterfaceDevice().play(.click)
        
        print("WATCH - Getting subscription list")
        print("received message : \(message)")
        
        if ((message["Subscribed Game"]) != nil){
            
            self.subscribedGames = message["Subscribed Game"]  as! [String]
            print("Number of subscribed games: \(self.subscribedGames.count)")
            self.subscriptionTable.setNumberOfRows(self.subscribedGames.count, withRowType: "subscritpion_cell")
            
            for (i, team) in subscribedGames.enumerated()
            {
                print("Team: \(i)")
                print("subscribedGames[i]: \(subscribedGames[i])")
                noSub.setText("List of Subscribed Game")
                let row = self.subscriptionTable.rowController(at: i) as! SubscriptionController
                row.date_label.setText(subscribedGames[i])
                print("Row : \(row)")
                
                if (self.subscribedGames.count == 0)
                {
                    noSub.setText("No Subscribed Games")
                }
            }
        }
    }
}
