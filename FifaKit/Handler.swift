//
//  Handler.swift
//  FIFA
//
//  Created by shivam gandhi on 2019-03-07.
//  Copyright © 2019 shivam gandhi. All rights reserved.
//

import Foundation

public class HandlerClass {
    
    public var TeamArray : Array<Team>
    public var MatchArrayTeam1: Array<Match>
    public var MatchArrayTeam2: Array<Match>
    public var subscribedMatches : Array<String>
    
    public class var sharedInstance : HandlerClass {
        struct Singleton {
            static let instance = HandlerClass()
        }
        return Singleton.instance
    }
    
    init() {
        self.TeamArray = Array()
        self.MatchArrayTeam1 = Array()
        self.MatchArrayTeam2 = Array()
        self.subscribedMatches = Array()
        insertData()
    }
    
    public func insertData()
    {
        addTeamDetails()
        addMatchDetailsTeam1()
        addMatchDetailsTeam2()
    }
    public func addTeamDetails(){
        TeamArray.append(Team(name: "france",flag: #imageLiteral(resourceName: "france_flag")))
        TeamArray.append(Team(name: "germany",flag: #imageLiteral(resourceName: "germany_flag")))
        TeamArray.append(Team(name: "korea",flag: #imageLiteral(resourceName: "korea_flag")))
    }
    public func addMatchDetailsTeam1(){
        MatchArrayTeam1.append(Match(date: "Friday 7th June",group: "Group A",time: "21:00",Name: "France",Flag: #imageLiteral(resourceName: "france_flag")))
        MatchArrayTeam1.append(Match(date: "Saturday 8th June",group: "Group B",time: "15:00",Name: "Germany",Flag: #imageLiteral(resourceName: "germany_flag")))
        MatchArrayTeam1.append(Match(date: "Sunday 9th June",group: "Group C",time: "13:00",Name: "Australia",Flag: #imageLiteral(resourceName: "aus_flag")))
        MatchArrayTeam1.append(Match(date: "Monday 10th June",group: "Group D",time: "18:00",Name: "Argentina",Flag: #imageLiteral(resourceName: "argentina_flag")))
        MatchArrayTeam1.append(Match(date: "Tuesday 11th June",group: "Group E",time: "15:00",Name: "New Zealand",Flag: #imageLiteral(resourceName: "new_zealand_flag")))
        MatchArrayTeam1.append(Match(date: "Wednesday 12th June",group: "Group A",time: "18:00",Name: "Nigeria",Flag: #imageLiteral(resourceName: "nigeria_flag")))
        MatchArrayTeam1.append(Match(date: "Thursday 13th June",group: "Group C",time: "15:00",Name: "Australia",Flag: #imageLiteral(resourceName: "aus_flag")))
        MatchArrayTeam1.append(Match(date: "Friday 14th June",group: "Group D",time: "18:00",Name: "Japan",Flag: #imageLiteral(resourceName: "japan_flag")))
        MatchArrayTeam1.append(Match(date: "Saturday 15th June",group: "Group E",time: "15:00",Name: "Netherlands",Flag: #imageLiteral(resourceName: "netherlands_flag")))
        MatchArrayTeam1.append(Match(date: "Sunday 16th June",group: "Group F",time: "15:00",Name: "Sweden",Flag: #imageLiteral(resourceName: "sweeden_flag")))
        MatchArrayTeam1.append(Match(date: "Monday 17th June",group: "Group B",time: "15:00",Name: "China PR",Flag: #imageLiteral(resourceName: "china_flag")))
        MatchArrayTeam1.append(Match(date: "Tuesday 18th June",group: "Group C",time: "21:00",Name: "Jamica",Flag: #imageLiteral(resourceName: "jaimica_flag")))
        MatchArrayTeam1.append(Match(date: "Wednesday 19th June",group: "Group D",time: "21:00",Name: "Japan",Flag: #imageLiteral(resourceName: "japan_flag")))
        MatchArrayTeam1.append(Match(date: "Thursday 20th June",group: "Group E",time: "18:00",Name: "Cameroon",Flag: #imageLiteral(resourceName: "cameroon_flag")))
    }
    public func addMatchDetailsTeam2(){
        MatchArrayTeam2.append(Match(date: "Friday 7th June",group: "Group A",time: "21:00",Name: "Korea Republic",Flag: #imageLiteral(resourceName: "korea_flag")))
        MatchArrayTeam2.append(Match(date: "Saturday 8th June",group: "Group B",time: "15:00",Name: "China PR",Flag: #imageLiteral(resourceName: "china_flag")))
        MatchArrayTeam2.append(Match(date: "Sunday 9th June",group: "Group C",time: "13:00",Name: "Itely",Flag: #imageLiteral(resourceName: "italy_flag")))
        MatchArrayTeam2.append(Match(date: "Monday 10th June",group: "Group D",time: "18:00",Name: "Japan",Flag: #imageLiteral(resourceName: "japan_flag")))
        MatchArrayTeam2.append(Match(date: "Tuesday 11th June",group: "Group E",time: "15:00",Name: "Netherlands",Flag: #imageLiteral(resourceName: "netherlands_flag")))
        MatchArrayTeam2.append(Match(date: "Wednesday 12th June",group: "Group A",time: "18:00",Name: "Korea Republic",Flag: #imageLiteral(resourceName: "korea_flag")))
        MatchArrayTeam2.append(Match(date: "Thursday 13th June",group: "Group C",time: "15:00",Name: "Brazil",Flag: #imageLiteral(resourceName: "brazil_flag")))
        MatchArrayTeam2.append(Match(date: "Friday 14th June",group: "Group D",time: "18:00",Name: "Scotland",Flag: #imageLiteral(resourceName: "scotland_flag")))
        MatchArrayTeam2.append(Match(date: "Saturday 15th June",group: "Group E",time: "15:00",Name: "Cameroon",Flag: #imageLiteral(resourceName: "cameroon_flag")))
        MatchArrayTeam2.append(Match(date: "Sunday 16th June",group: "Group F",time: "15:00",Name: "Thailand",Flag: #imageLiteral(resourceName: "thailand_flag")))
        MatchArrayTeam2.append(Match(date: "Monday 17th June",group: "Group B",time: "15:00",Name: "Spain",Flag: #imageLiteral(resourceName: "spain_flag")))
        MatchArrayTeam2.append(Match(date: "Tuesday 18th June",group: "Group C",time: "21:00",Name: "Australia",Flag: #imageLiteral(resourceName: "aus_flag")))
        MatchArrayTeam2.append(Match(date: "Wednesday 19th June",group: "Group D",time: "21:00",Name: "England",Flag: #imageLiteral(resourceName: "england_flag")))
        MatchArrayTeam2.append(Match(date: "Thursday 20th June",group: "Group E",time: "18:00",Name: "New Zealand",Flag: #imageLiteral(resourceName: "new_zealand_flag")))
    }
    
    public func getTeamArray() -> [Team] {
        return self.TeamArray
    }
    public func getMatchTeam1Array() -> [Match] {
        return self.MatchArrayTeam1
    }
    public func getMatchTeam2Array() -> [Match] {
        return self.MatchArrayTeam2
    }
    public func addToSubscriptionList(val: String) {
        subscribedMatches.append(val)
    }
    public func removeFromSubscriptionList(val: String){
        if subscribedMatches.count > 0{
            for n in 0...subscribedMatches.count-1 {
                if(subscribedMatches[n] == val){
                    subscribedMatches.remove(at: n)
                }
            }
        }
    }
    public func getSubscriptionList() -> [String]{
        return self.subscribedMatches
    }
    public func checkIfSubscribed(val: String) -> Bool{
        for n in 0...subscribedMatches.count-1 {
            if(subscribedMatches[n] == val){
                return true
            }
        }
        return false
    }
}
