import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    let eggTimes = ["Soft": 3, "Medium": 4, "Hard": 7]
    var timer = Timer()
    var totalTime = 0
    var secondsPassed = 0

    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        
        let hardness = sender.currentTitle!;
        
        totalTime = eggTimes[hardness]!
        progressBar.progress = 0.0
        secondsPassed = 1
        titleLabel.text = hardness
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            secondsPassed += 1
        } else {
            timer.invalidate()
            progressBar.progress = 1.0
            titleLabel.text = "DONE!"
        }
    }
    
}
