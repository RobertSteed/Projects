//
//  MeetingTimes.swift
//  Civil Servants
//
//  Created by Robert Steed on 3/20/23.
//
import UIKit
import SwiftUI
import FSCalendar

struct CalendarView: View {
    
    @State var selectedDate: Date = Date()
    
    var body: some View {
        VStack {
            FormattedDate(selectedDate: selectedDate, omitTime: true)
            CalendarViewRepresentable(selectedDate: $selectedDate)
        }
    }
}
    
struct CalendarViewRepresentable: UIViewRepresentable {
    typealias UIViewType = FSCalendar
    fileprivate var calendar = FSCalendar()
    @Binding var selectedDate: Date

    func makeUIView(context: Context) -> FSCalendar {
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        return calendar
    }

    func updateUIView(_ uiView: FSCalendar, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject,
          FSCalendarDelegate, FSCalendarDataSource {
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
        }
        
            var parent: CalendarViewRepresentable

            init(_ parent: CalendarViewRepresentable) {
                self.parent = parent
            }
    }
}


//    VStack {
  //                     LazyVGrid(columns: sevenColumnGrid) {
  //                         // ** 2. items ** //
  //
  //                         ForEach(models) { model in
  //                            VStack {
  //                                Text(model.date)
  //                                    .frame(maxWidth: .infinity, alignment: .trailing)
  //                                  ForEach(model.items) { item in
  //                                    if let name = item.name {
  //                                        VStack {
  //                                           Spacer()
  //                                            Text(name)
  //                                               .frame(maxWidth: .infinity, alignment: .center)
  //                                           Spacer()
  //                                       }
  //                                       .background(Color.green.opacity(0.3))
  //                                       .cornerRadius(4)
  //                                   } else {
  //                                       VStack {
  //                                           Spacer()
  //                                           Text("")
  //                                               .frame(maxWidth: .infinity, alignment: .center)
  //                                           Spacer()
  //                                       }
  //                                       .background(Color.white)
  //                                   }
  //                                }
  //                                 if model.items.isEmpty {
  //                                    Spacer()
  //                                 }
  //                             }
  //                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, alignment: .center)
  //                         }
  //
  //                      }
  //                   .animation(.default, value: models)
  //                }
  //                .background(Color.white)
  //            }

    //    @State private var models: [CalendarViewModel] = [CalendarViewModel(date: "1", items: [ScheduleItem(name: "Coding")]),
    //        CalendarViewModel(date: "2", items: []),
    //        CalendarViewModel(date: "3", items: []),
    //        CalendarViewModel(date: "4", items: []),
    //        CalendarViewModel(date: "5", items: []),
    //        CalendarViewModel(date: "6", items: []),
    //        CalendarViewModel(date: "7", items: []),
    //        CalendarViewModel(date: "8", items: []),
    //        CalendarViewModel(date: "9", items: []),
    //        CalendarViewModel(date: "10", items: []),
    //        CalendarViewModel(date: "11", items: []),
    //        CalendarViewModel(date: "12", items: []),
    //        CalendarViewModel(date: "13", items: []),
    //        CalendarViewModel(date: "14", items: []),
    //        CalendarViewModel(date: "15", items: []),
    //        CalendarViewModel(date: "16", items: []),
    //        CalendarViewModel(date: "17", items: []),
    //        CalendarViewModel(date: "18", items: []),
    //        CalendarViewModel(date: "19", items: []),
    //        CalendarViewModel(date: "20", items: []),
    //        CalendarViewModel(date: "21", items: []),
    //        CalendarViewModel(date: "22", items: []),
    //        CalendarViewModel(date: "23", items: []),
    //        CalendarViewModel(date: "24", items: []),
    //        CalendarViewModel(date: "25", items: []),
    //        CalendarViewModel(date: "26", items: []),
    //        CalendarViewModel(date: "27", items: []),
    //        CalendarViewModel(date: "28", items: []),
    //        CalendarViewModel(date: "29", items: []),
    //        CalendarViewModel(date: "30", items: []),
    //        CalendarViewModel(date: "31", items: [ScheduleItem(name: "Eating")])]
    //    @State private var dragging: ScheduleItem?
    //    private let sevenColumnGrid = Array(repeating: GridItem(.flexible(), spacing: 0), count: 7)
    //
