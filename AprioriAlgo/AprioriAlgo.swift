//
//  AprioriAlgo.swift
//  AprioriAlgo
//
//  Created by Mohsin on 14/10/2015.
//  Copyright (c) 2015 Mohsin. All rights reserved.
//

import Foundation


class AprioriAlgo{
    
    // transactionID : ["milk","bread","butter","egg"]
    var transactions = [
        "1" : [true,true,false,false],
        "2" : [false,false,true,false],
        "3" : [false,false,false,true],
        "4" : [true,true,false,true],
        "5" : [true,true,true,false],
        
    ]
    
    var minFreqInPercent = 50.0
    
    var items = ["milk","bread","butter","egg"]
    
    func sliceArray(var arr: Array<Int>, x1: Int, x2: Int) -> Array<Int> {
        var tt: Array<Int> = []
        for var ii = x1; ii <= x2; ++ii {
            tt.append(arr[ii])
        }
        return tt
    }
    
    func combinations(var arr: Array<Int>, k: Int) -> Array<Array<Int>> {
        var i: Int
        var subI : Int
        
        var ret: Array<Array<Int>> = []
        var sub: Array<Array<Int>> = []
        var next: Array<Int> = []
        for var i = 0; i < arr.count; ++i {
            if(k == 1){
                ret.append([arr[i]])
            }else {
                sub = combinations(sliceArray(arr, x1: i + 1, x2: arr.count - 1), k: k - 1)
                for var subI = 0; subI < sub.count; ++subI {
                    next = sub[subI]
                    next.insert(arr[i], atIndex: 0)
                    ret.append(next)
                }
            }
            
        }
        return ret
    }
    
    // check for availablity in transection
    func check( array1 : [Bool], array2 : [Int]) -> Bool{

        for x in array2{
            if !array1[x]{
                return false
            }
        }
        return true
    }
    
    
    func frequencyCount(transactions: [String : [Bool]], itemIndex : Int) -> Int{
        var count = 0
        
        for tran in transactions{
            if tran.1[itemIndex] {
                count++
            }
        }
        
        return count
    }
    
    // print items name against index number
    func printItem(array : [Int], items : [String]){
        for x in array {
            print(" \(items[x]),")
        }
        
    }
    
    
    
    
    func start(){
        for x in 1...4 {
            let myCombinations = combinations([0,1,2,3],k: x)
            
//            println(myCombinations)
            
            for subTransection in myCombinations{
                var count = 0.0
                
                for tran in transactions {
                    if check(tran.1, array2: subTransection){
                        count++
                    }
                }
                
                
                
                let freqInPercent = (count/Double(transactions.count))*100.0
                
                if freqInPercent >= minFreqInPercent{
                    
                    println("for")
                    printItem(subTransection, items: items)
                    println("= Support : \(freqInPercent)%")
                }

            }
            
        }
    }

    

    
}