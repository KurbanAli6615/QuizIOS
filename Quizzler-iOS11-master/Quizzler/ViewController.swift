
import UIKit
import ProgressHUD

class ViewController: UIViewController {
    
    //Place your instance variables here
    
    let allQuestions = QuestionBank()
    var counter = 0
    var score = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score)"
        progressLabel.text = "\(counter+1)"
        let fq = allQuestions.list[counter]
        counter += 1
        questionLabel.text = fq.questionText
    }
    
    
    @IBAction func answerPressed(_ sender: AnyObject) {
        checkAnswer(tag: sender.tag)
        updateUI()
    }
    
    
    func updateUI() {
        
        if counter > 12 {
            startOver()
        }
        else {
        var aq = allQuestions.list[counter]
        questionLabel.text = aq.questionText
        scoreLabel.text = "\(score)"
        progressLabel.text = "\(counter+1)"

        counter += 1
        }
    }
    
    
    func checkAnswer(tag:Int) {
        
        if counter > 12 {
            startOver()
        }
        else{
            
        var question = allQuestions.list[counter]
            
        var tempBool = true
        if tag == 1 {
            tempBool = true
        }
        else {
            tempBool = false
        }
        
        if tempBool == question.answer {
            ProgressHUD.showSuccess("Correct")
            score += 1
        }
        else {
            ProgressHUD.showError("Wrong !")
        }
        }
    }
    
    
    func startOver() {
        let alert = UIAlertController(title: "Restart", message: "Game Restarted...!. Your score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
        }))
        
        self.present(alert, animated: true, completion: nil)
        
        counter = 0
        score = 0
    }
    
}
