//
//  ViewController.swift
//  fitness
//
//  Created by Владислав Козырь on 23.04.21.
//

import UIKit
import Charts 
class ViewController: UIViewController {
    
    @IBOutlet weak var chtChart: LineChartView!
    
    @IBOutlet weak var BackgroundOfBreakfast: UIImageView!
    @IBOutlet weak var BackgroundOfLunch: UIImageView!
    @IBOutlet weak var BackgroundOfDinner: UIImageView!
    
    @IBOutlet weak var EditBreakfast: UIView!
    @IBOutlet weak var EditLunch: UIView!
    @IBOutlet weak var EditDinner: UIView!
    @IBOutlet weak var EditBurnt: UIView!
    
    @IBOutlet weak var RBreakfast: UIButton!
    @IBOutlet weak var RLunch: UIButton!
    @IBOutlet weak var RDinner: UIButton!
    @IBOutlet weak var RBurnt: UIButton!
    
    @IBOutlet weak var TotalLabel: UILabel!
    @IBOutlet weak var BreakfastLabel: UILabel!
    @IBOutlet weak var LunchLabel: UILabel!
    @IBOutlet weak var DinnerLabel: UILabel!
    @IBOutlet weak var EatingLabel: UILabel!
    @IBOutlet weak var BurntLabel: UILabel!
    
    @IBOutlet weak var TextFieldOfBreakfast: UITextField!
    @IBOutlet weak var TextFieldOfLunch: UITextField!
    @IBOutlet weak var TextFieldOfDinner: UITextField!
    @IBOutlet weak var TextFieldBurnt: UITextField!
    
    var AllKcal = [0, 0, 0, 0, 0]
    var burnt = 0
   
    
    @IBAction func ButtonOfBreakfast(_ sender: UIButton) {
        BackgroundOfBreakfast.isHidden = false
        EditBreakfast.isHidden = false
    }
    
    @IBAction func ButtonOfLunch(_ sender: UIButton) {
        BackgroundOfLunch.isHidden = false
        EditLunch.isHidden = false
    }
    
   
    @IBAction func ButtonOfDinner(_ sender: UIButton) {
        BackgroundOfDinner.isHidden = false
        EditDinner.isHidden = false
    }
    
    
    @IBAction func ButtonOfBurnt(_ sender: UIButton) {
    
        EditBurnt.isHidden = false
    
    }
    

    
    @IBAction func ReadyBurnt(_ sender: UIButton) {
        EditBurnt.isHidden = true
        var BurntKcal = 0
        if let Burnt = Int(TextFieldBurnt.text!)
        {
            let MidBurnt = burnt
            BurntKcal = Burnt + MidBurnt
        }
        TextFieldBurnt.resignFirstResponder()
        BurntLabel.text = "\(BurntKcal)"
        let total = (AllKcal[1] +  AllKcal[2] + AllKcal[3]) - BurntKcal
        burnt = BurntKcal
        TotalLabel.text = "\(total)"
        
        
    }
    
    
    @IBAction func ReadyBreakfast(_ sender: UIButton) {
        EditBreakfast.isHidden = true
    
        
     var BreakfastKcla = 0
    if let Breakfast = Int(TextFieldOfBreakfast.text!)
    {
        BreakfastKcla = Breakfast
    }
        TextFieldOfBreakfast.resignFirstResponder()
        BreakfastLabel.text = "\(BreakfastKcla)"
        AllKcal[1] = BreakfastKcla
        calorieCounting()
        updateGraph()
        
    }
    
    
    
    @IBAction func ReadyLunch(_ sender: UIButton) {
        EditLunch.isHidden = true
        
     var LunchKcla = 0
        
    if let Lunch = Int(TextFieldOfLunch.text!)
    {
        LunchKcla = Lunch
    }
        TextFieldOfLunch.resignFirstResponder()
        LunchLabel.text = "\(LunchKcla)"
        AllKcal[2] = LunchKcla
        calorieCounting()
        updateGraph()
        
    }
    
    
    @IBAction func ReadyDinner(_ sender: UIButton) {
        EditDinner.isHidden = true
        
     var DinnerKcla = 0
        
    if let Dinner = Int(TextFieldOfDinner.text!)
    {
        DinnerKcla = Dinner
    }
        TextFieldOfDinner.resignFirstResponder()
        DinnerLabel.text = "\(DinnerKcla)"
        AllKcal[3] = DinnerKcla
        calorieCounting()
        updateGraph()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calorieCounting()
        updateGraph()
    }

    
    
    
    func updateGraph() {
        var lineChartEntry = [ChartDataEntry]()
    
     for i in 0..<AllKcal.count {
        let value = ChartDataEntry(x: Double(i), y: Double(AllKcal[i]))
        lineChartEntry.append(value)
            }
        let line = LineChartDataSet(entries: lineChartEntry, label: "All calories")
        line.colors = [NSUIColor.blue]
        line.mode = .cubicBezier
        line.lineWidth = 2
        line.circleColors = [NSUIColor.black]
        line.circleHoleRadius = 0.1
        line.circleRadius = 1.5
        let data = LineChartData()
        data.addDataSet(line)
        chtChart.data = data
        chtChart.rightAxis.enabled = false
        chtChart.leftAxis.enabled = false
        chtChart.xAxis.enabled = false
        
        
       
       
        
    }
    
    
    func calorieCounting() {
        let total = (AllKcal[1] + AllKcal[2] + AllKcal[3]) - burnt
        TotalLabel.text = "\(total)"
        let Eating =  AllKcal[1] +  AllKcal[2] + AllKcal[3]
        EatingLabel.text = "\(Eating)"
       }
    
    

}



