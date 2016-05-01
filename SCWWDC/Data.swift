//
//  Data.swift
//  SCWWDC
//
//  Created by Sebastian Cain on 4/28/16.
//  Copyright © 2016 Sebastian Cain. All rights reserved.
//

import UIKit

class Data: NSObject {
    //static var labelStrings = [[String]]()
    //static var hexStrings = [[String]]()
    
    static var labelStrings = [
            ["hackathons", "Hackathons are awesome coding marathons I attend.", "They inspire me to focus and learn."],
            ["projects", "I work on projects mainly for personal gain,", "but I also love making something meaningful."],
            ["experience", "My experience makes me who I am as a programmer.", "Working with organizations gives me a sense of purpose."],
            ["about me", "While I love programming and the related community,", "my personal experiences also shape who I am."],
            
        ]
    static var hexStrings = [
            ["PennApps", "CodeDay", "HackBCA", "HackRU", "Bitcamp", "StuyHacks"],
            ["Smith", "Viewzik", "MagicPen", "Deflector", "Reppin", "Cuddle"],
            ["Keep", "Isometric", "Plutonium", "StuyHacks", "Stuy3D", "FRC 694"],
            ["Education", "Location", "History", "Pursuits", "Awards", "Philosophy"]
        ]
    static var detailContent =
    [
        [
            ["PennApps", "Jan 2015/Sep 2015/Jan 2016 - Philadelphia, PA", "PennApps was the first collegiate hackathon I attended. I was admitted to PennApps XI in Jan 2015, and then proceeded to get into and attend PennApps XII and XIII. At PennApps XIII, I presented on stage as part of the top 10."],
            ["CodeDay", "May 2014/Nov 2014/Feb 2015 - NYC, NY", "CodeDay was the first hackathon I attended in May 2014. I went 2 more times in Nov 2014 and Feb 2015, and at the latter I won the award for Best App with a very functional and fast music visualizer."],
            ["HackBCA", "March 2015/April 2016 - Bergen, NJ", "HackBCA II was the first major highschool hackathon I attended in March of 2015. At that, I built a virtual assistant that won second place overall. When I returned in April this year, I won third place overall with a smart fitness app."],
            ["HackRU", "April 2015/Sep 2015 - Rutgers, NJ", " HackRU April and September 2015 gave me some solid time to work on personal projects. While getting 'hyped' for hackathons can result in great end projects, It's also a great way to spend some time on longer term projects."],
            ["Bitcamp", "April 2016 - College Park, MD", "Bitcamp 2016 was likely the furthest hackathon I've traveled to, coming from NYC to the DC area. It was my first time hacking on an Oculus Rift, and I'm excited to keep working on the amazing sector of VR."],
            ["StuyHacks", "Nov 2015/May 2016 - NYC, NY", "StuyHacks is the hackathon hosted by my school, Stuyvesant HS, in NYC. I was one of the four founders in the summer of 2015, and am currently the Director of Design. In November 2015 we hosted a Local Hack Day with MLH, but this May we'll host a full 24-hour hackathon at ThoughtWorks NYC."]
        ],
        [
            ["Smith", "March 2015", "Smith is an iOS App I created on a team to create a more convenient way for people to interact with their phones. When a table with the iPhone on it is knocked, the iPhone senses the vibration pattern and opens an app based on preset patterns. It won 2nd overall at HackBCA II."],
            ["Viewzik", "Feb 2015", "Viewzik is a music visualizer/editor iOS app I made with two friends. It uses the Superpowered Audio DSL SDK and CoreAnimation to both visualize music in a new way and be able to apply effects in realtime. It won Best App at CodeDay Feb 2015."],
            ["MagicPen", "Feb 2015", "MagicPen is an iOS app I worked on a team to create. We used the magnometer on the iPhone to get magnitude values, then mapped polar coordinates to cartesian ones in order to allow someone writing on a desk with a custom 3D printed magnet pen we created to see their words etched on the screen."],
            ["Deflector", "Nov 2014", "Deflector is a simple game I made with my friend Josh Liu with Swift and SpriteKit. We published it the next January, and received 1000+ downloads the first week, in addition to being featured #24 in Top New Games, according to App Annie."],
            ["Reppin", "April 2016", "Reppin is an iOS app I worked on in a large team. We used OpenCV and a good amount of design expertise to create an awesome looking fitness app that counted your reps of any given exercise by mapping the position of your shirt. It won 3rd overall at HackBCA III."],
            ["Cuddle", "Jan 2016", "Cuddle is an iOS app I worked on with 3 college seniors. We used existing imaging technologies to find the heartrate of any given person simply by recording their skin. We created an interface and new use for it as a baby monitor, and won a spot in the Top 10 at PennApps XIII."]
        ],
        [
            ["Keep", "Summer 2015", "I was a paid iOS Developer Intern at a startup called Keep for the summer of 2015. I worked on animations and custom user interface controls for Refill, a side project whose goal was to provide a service to refill anything you need with two taps and one-day delivery. Check out Keep at http://keep.com."],
            ["Isometric", "Nov 2014 - Present", "I created a small 4-person iOS Development firm that makes in-house projects as well as accepts jobs from clients, specializing in iOS Development. We've done several jobs to date, check us out at http://isometricapps.com."],
            ["Plutonium", "Jan 2016 - Present", "I'm currently a contract iOS Devloper for Plutonium Apps, where I develop, maintain, and update large scale applications for various clients, including Qollaboration and PartyVIP."],
            ["StuyHacks", "Nov 2015/May 2016", "As previously mentioned, I'm the Director of Design for StuyHacks. With a team of four people working under me, we work to create a new and innovative design for our school's hackathon. In addition, during the hackathon I am an iOS mentor, and lead a Design workshop."],
            ["Stuy3D", "Sep 2013 - Present", "Stuy3D is a club at my school, Stuyvesant HS, that has a makerspace-like meeting every week where we program and print 3D objects with our 2 UPrintSE's. After being a member for two years, I was given the club president position at the beginning of my junior year."],
            ["FRC 694", "Sep 2013 - Present", "FRC 694 is a FIRST Robotics team that competes in the FRC international robotics competition each year. I assist in programming the AI of the robots, and we made it all the way to world champions this year."]
        ],
        [
            ["Education", "Mark Twain - Stuyvesant HS", "I grew up in the District 15, and went to acclaimed PS 321. From there, I was accepted into Mark Twain Intermediate School for the Gifted and Talented. After Junior High, I scored high enough on the SHSAT to get into Stuyvesant High School, the most exclusive Specialized HS in NYC and one of the highest scoring schools nationwide."],
            ["Location", "Brooklyn, NY", "I live in Park Slope, Brooklyn, in New York City. I'm grateful that my proximity to Manhattan has allowed me to travel easily to many events and hackathons, and allowed me to search for internships in the vast NYC market of startups."],
            ["History", "My programming story", "I started programming in JavaScript in 7th grade with a friend, doing practice exercises on Codecademy. After a long pause, in 9th grade an open-ended English project led me to create an iOS app and document the experience, and I've been hooked ever since."],
            ["Pursuits", "Tennis/Drumming", "In addition to programming, I also am an avid tennis player, and I play for the Boys Varsity team at Stuyvesant. I'm also a drummer, and played percussion for 3 years in the Mark Twain Band, earning Gold with Distinction at NYSSMA, a High School music competition."],
            ["Awards", "Recognized Accomplishments", "While programming is my passion with or without recognition, it's nice to see your work appreciated by others. While many were previously mentioned, I've acquired Best Mobile App + 3rd Overall at HackBCA III, Top 10 at PennApps Winter 2016, Finalist at Dream It, Code It, Win It, Second Place Overall at HackBCA II, and Best Application at CodeDay Winter 2015."],
            ["Philosophy", "The Way I Think", "I started programming not for some greater purpose, or for a job, I just thought it was cool. However, now that I've come to understand the value of programming in the modern world and ultimately the future, it's hard not to be enthralled by the possibilities."]
        ],
    ]
}
