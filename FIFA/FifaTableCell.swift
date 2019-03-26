//
//  FifaTableCell.swift
//  FIFA
//
//  Created by shivam gandhi on 2019-03-07.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import UIKit
import WatchConnectivity
import FifaKit

public class FifaTableCell: UITableViewCell,WCSessionDelegate {
    
    var subscriptionList: [String] = []
    var exist: Bool = false
    var supported: Bool = false
    var message = [String: [String]]()
    
    @IBOutlet weak var date_label: UILabel!
    @IBOutlet weak var team1_flag: UIImageView!
    @IBOutlet weak var team1_name: UILabel!
    @IBOutlet weak var team2_flag: UIImageView!
    @IBOutlet weak var team2_name: UILabel!
    @IBOutlet weak var group: UILabel!
    @IBOutlet weak var start_labek: UILabel!
    @IBOutlet weak var subscription_button: UIButton!
    
    
    @IBAction func Subcribe(_ sender: UIButton) {
        
        if (WCSession.isSupported()) {
            supported = true
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
    
        exist = false
        let dataHandler = HandlerClass.sharedInstance
        subscriptionList = dataHandler.getSubscriptionList()
        
        if subscriptionList.count > 0 {
            for n in 0...subscriptionList.count-1 {
                if(subscriptionList[n] == date_label.text){
                    exist = true
                }
            }
        }
        if(!exist){
            subscription_button.setTitle("UnSubscribe", for: .normal)
            
            dataHandler.addToSubscriptionList(val: date_label.text!)
            
            print(dataHandler.getSubscriptionList().description)
            
            if(supported){
                message = ["Subscribed Game":dataHandler.getSubscriptionList()]
                WCSession.default.sendMessage(message, replyHandler: nil)
            }
        }
        else{
            subscription_button.setTitle("Subscribe", for: .normal)
            dataHandler.removeFromSubscriptionList(val: date_label.text!)
            if(supported){
                message = ["Subscribed Game":dataHandler.getSubscriptionList()]
                WCSession.default.sendMessage(message, replyHandler: nil)
            }
        }
        
        if dataHandler.getSubscriptionList().count > 0 {
            for i in 0...dataHandler.getSubscriptionList().count-1{
                print("inside loop")
                print(dataHandler.getSubscriptionList()[i])
            }
        }
        
        
        
    }
    
    func setSchedule(matchTeam1: Match, matchTeam2: Match){
        date_label.text = matchTeam1.getDate()
        team1_flag.image = matchTeam1.getFlag()
        team1_name.text = matchTeam1.getName()
        team2_flag.image = matchTeam2.getFlag()
        team2_name.text = matchTeam2.getName()
        group.text = matchTeam2.getGroup()
        start_labek.text = matchTeam2.getTime()
    }
    
    public func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    public func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    public func sessionDidDeactivate(_ session: WCSession) {
        
    }
}
