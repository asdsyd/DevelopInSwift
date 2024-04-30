struct ConversationDelegate {
    /// Creates a String in response to another String.
    func responseTo(question: String) -> String {
        let lowerQuestion = question.lowercased()
        
        if lowerQuestion.hasPrefix("hello") || lowerQuestion.hasPrefix("hi") {
            return "Hello there! How you doing?"
        } else if lowerQuestion == "where are the cookies?" {
            return "In the cookie jar! Just look in there!"
        } else if lowerQuestion.hasPrefix("where") {
            return "*accepts cookies on website*"
        }else if lowerQuestion.contains("fine") {
            return "That's great to hear! What are you looking forward to this day?"
        } else {
            let defaultNumber = question.count % 3
            
            if defaultNumber == 0 {
                return "That really depends"
            } else if defaultNumber == 1 {
                return "I think so, yes"
            } else {
                return "Ask me again tomorrow I am out of answers :p\n"
            }
        }
    }
}
