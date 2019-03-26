//
//  ViewController.swift
//  FIFA
//
//  Created by shivam gandhi on 2019-03-07.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import UIKit
import FifaKit
import WatchConnectivity

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    
    func sessionDidBecomeInactive(_ session: WCSession) {
        
    }
    
    func sessionDidDeactivate(_ session: WCSession) {
        
    }
    
    
    @IBOutlet weak var fifaTable: UITableView!
    
    var dataHandler = HandlerClass.sharedInstance
    var temp : [Match] = []
    var temp1 : [Match] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        temp = dataHandler.getMatchTeam1Array()
        temp1 = dataHandler.getMatchTeam2Array()
        
        fifaTable.delegate = self
        fifaTable.dataSource = self
        
        fifaTable.rowHeight = 130
        
        if (WCSession.isSupported()) {
            print("Connected")
            let session = WCSession.default
            session.delegate = self
            session.activate()
        }
        else
        {
            print("Not Reachable")
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return temp1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let fifaMatch_team1 = temp[indexPath.row]
        let fifaMatch_team2 = temp1[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "fifa_cell") as! FifaTableCell
    
        cell.setSchedule(matchTeam1: fifaMatch_team1, matchTeam2: fifaMatch_team2)
        
        return cell
    }

}

