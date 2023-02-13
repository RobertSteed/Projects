import UIKit

var greeting = "Hello, playground"


import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

func countingDown(s: Int, m: Int, h: Int) {
    
    var seconds = s
    var minutes = m
    var hours = h
    
    if seconds > 60 {
        seconds - 60
        minutes + 1
    } else if minutes > 60 {
        minutes - 60
        hours + 1
    }
    
    let timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
        
        if seconds == 0 && minutes != 0 {
            minutes -= 1
            seconds = 59
        } else if minutes == 0 && hours != 0 {
            hours -= 1
            minutes = 59
        } else if seconds != 0 {
            seconds -= 1
        }
        
        if hours == 0 && minutes == 0 && seconds == 0 {
            print("finished!")
            timer.invalidate()
        }
    }
}


countingDown(s: 30, m: 1, h: 0)
