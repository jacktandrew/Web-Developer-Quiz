title = <<TITLE

  A test of web developer knowledge

TITLE
print title
$correct = 0
$n = 1                      # A variable that counts and displays which number you are on for the Flashcard Test
@explain = {}               # A hash stores the questions and explainations for the Flashcard Test 
@input = ""                 # A variable is used throughout both tests for user input
              # A variable that counts the correct answers for both tests
@one_test = []              # A array that will be populated with questions from All_the_tests
@multi_choice_array = []    # An empty array that will be filled with multiple 4 choice answers

                            # An array that contains all three tests
                            # A symbol or tag at [0]
                            # The name of the symbol or tag [1] 
                            # A description of the at [2]
                            # and a sub-array of keywords [3] 
                            # Later I may make a function to evalute the 
                            # Explainations but I've left that for another day
                            # for now [3] is not used
All_the_tests = [ 
  [                         # a sub-array containing all the Regexp_questions 
    ['?','question mark','? means optional', ['optional', 'optional'] ],
    ['+','plus sign','+ means one or more', ['one', 'more'] ],
    ['*','asterisk','* means zero or more', ['zero', 'more'] ],
    ['\\d','d for digit','\\d is a shortcut for any digit', ['shortcut', 'digit'] ],
    ['\\s','s for space','\\s is a shortcut for any whitespace', ['shortcut', 'whitespace'] ],
    ['\\w','w for word','\\w is a shortcut for any word character class', ['shortcut', 'word'] ],
    ['.','period','. is a shortcut for any non-newline character', ['shortcut', 'non-newline'] ],
    ['a-z','range','character classes can include ranges', ['can', 'range'] ],
    ['A-Z','range','character classes can include ranges', ['can', 'range'] ],
    ['0-9','range','character classes can include ranges', ['can', 'range'] ],
    ['^','caret','^ can negate a character class', ['negate', 'negate'] ],
    ['\\D','D for digit','Everything BUT digits because capital negate!', ['capital', 'negate', 'digit'] ],
    ['\\S','S for space','Everything BUT spaces because capital negate!', ['capital', 'negate', 'space'] ],
    ['\\W','W for word','Everything BUT words because capital negate!', ['capital', 'negate', 'word'] ],
    ['\\A','A for anchor','\\A anchors the start of a string', ['anchor', 'start', 'string'] ],
    ['\\z','z for anchor','\\z anchors the end of a string', ['anchor', 'end', 'string'] ],
    ['/^','caret','/^ anchors the start of lines', ['anchor', 'start', 'line'] ],
    ['$','dollar sign','$ anchors the end of lines', ['anchor', 'end', 'line'] ],
    ['\\b','b for boundary','\\b anchors to a word boundary', ['anchor', 'word', 'boundary'] ],
    ['()','parentheses','() group content', ['group', 'content'] ],
    ['|','pipe','| means "or"', ['or', 'or'] ],
    ['[]','brackets','range specificication (e.g., [a-z] means a letter in the range a to z)', ['range'] ],
    ['/','frontslash','starts and ends the regular expression', ['start', 'end', 'regular', 'expression'] ]
  ],
  [                          # a sub-array containing all the HTML_questions = 
    ['<p>','paragraph','small font used for body text', ['small', 'font', 'body'] ],
    ['<div>','division','empty container used to wrap other elements, no predefined style, block element',
       ['empty', 'container', 'block', 'element'] ],
    ['<H1>','headline','big font used as a title', ['big', 'font', 'title'] ],
    ['<ul>','unordered list','wraps list items and has no set order', ['list', 'wrap', 'order'] ],
    ['<li>','list item','wraps the text of a single line of a list', ['wrap', 'list', 'line'] ],
    ['<a>','anchor','wraps link to other page or actions', ['link', 'pages', 'wrap'] ],
    ['<img />','image','element used to include pictures, no close tag required', ['image', 'no', 'close'] ],
    ['<em>','emphasis','alters text, usually bold or italic', ['bold', 'text'] ],
    ['<span>','span','empty container, inline element', ['empty', 'container', 'inline', 'element'] ],
    ['<body>','body','wraps all content meant to be displayed on screen', ['all', 'screen', 'content'] ],
    ['<head>','head','wraps content not for display', ['not', 'display', 'content'] ],
    ['<script>','script','wraps text written in a script language usually JavaScript', ['script', 'language'] ],
    ['<html>','hypertext markup language','wraps everything', ['everything', 'wrap'] ],
    ['<style>','style','wraps text written in CSS', ['CSS', 'wrap'] ],
    ['<title>','title','assigns a title to the window', ['window', 'title'] ],
    ['id=','identification','marks 1 element so CSS or JS can select it', ['element', 'select', 'mark'] ],
    ['class=','classification','marks many element that can all be selected by CSS or JS', ['element', 'select', 'mark', 'many'] ],
    ['src=','source','points to the location of an internal file', ['point', 'location', 'file'] ],
    ['alt=', 'alternative', 'gives a description of a picture', ['description', 'picture'] ],
    ['href=','hypertext reference','points to the location of an external link', ['point','location','external','link'] ]
  ],
  [                            # a sub-array containing all the Symbols_questions = 
    ['{}','curly braces','wrap CSS attributes among other thing...'],
    ['[]','brackets','wrap arrays among other things...'],
    ['()','parentheses','wrap parameters among other things'],
    ['" "','double quotes','wrap strings among other things'],
    ["' '",'single quotes','wrap strings among other things'],
    ['\\','backslash','escapes characters the follow'],
    ['/','frontslash','used in closing HTML tags'],
    [':','colon','separates element and attribute in CSS'],
    [';','semi-colon','ends statements among other things...'],
    ['=','equals sign','sets the value of a variable'],
    ['?','question mark','used in asking questions'],
    ['.','dot','connects actions in scripts and shorthand for <div class=...> in CSS'],
    ['!','bang','indicates not in "!=" not equal among other things...'],
    ['_','underscore','used in place of "space" to divid words'],
    ['#','hash','placed before colors in hexidecimal AND shorthand for <div id=...> in CSS among other things...'],
    ['<!--','comment','use this ONLY in HTML to write a comment'],
    ['//','comment','use this ONLY in CSS or JavaScript'],
    ['&','ampersand','used before strange characters'],
    ['+','plus sign','used in math AND to concatenate strings']
  ],
  [
    ['**','Exponent','the preceding number is multiplied by itself the "exponent" number of times'],
    ['%','Remainder','when the preceding number is divide by the follow number the "remainder" is the value remaining'],
    ['+=','add to variable',''],
    ['-=','subtract from variable',''],
    ['*=','multiply variable by',''],
    ['/=','divide variable by',''],
    ['**=','multiply by itself "x" number of time',''],
    ['%=','get remainder',''],
    
    ['$!','latest error message',''],
    ['$@','location of error',''],
    ['$_','string last read by gets',''],
    ['$.','line number last read by interpreter',''],
    ['$&','string last matched by regexp',''],
    ['$~','the last regexp match, as an array of subexpressions',''],
    ['$n','the nth subexpression in the last match (same as $~[n])',''],
    ['$=','case-insensitivity flag',''],
    ['$/','input record separator',''],
    ['$\\','output record separator',''],
    ['$0','the name of the ruby script file',''],
    ['$*','the command line arguments',''],
    ['$$','interpreter\'s process ID',''],
    ['$?','exit status of last executed child process',''],
    
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
    ['','',''],
  ]
]

class Multiple_Choice_Test

    
  def choose_a_test                                               
    puts 'Do you want the (H)TML, (S)YMBOLS, or (R)EGEXP test?'
    print '> '
    choice_input = gets.chomp.capitalize              # User input is received and capitalized for uniformity
    c_input = choice_input[0]                         # Only the first letter of user input is stored 

    if c_input == 'R'                                 # If only checks the string's 1st letter was R 
      @one_test = All_the_tests[0]                   # The chosen sub-array is pull by it's index number
      subject = "RegExp"                              # A string is supplied for the title

    elsif c_input == 'H'                              # 'h', 'H', 'HTML' or even 'Hello' are all 'true'
      @one_test = All_the_tests[1]
      subject = "HTML"

    elsif c_input == 'S'
      @one_test = All_the_tests[2]
      subject = "Symbols"
    else                                              # Invalid input will result in an 
      puts "I didn't understand..."                   # An easy to read error message
      choose_a_test()                                 # and the function is called again
    end
  end

  def info_for_multi_choice_test
    info  = <<INFO

          Answer 1, 2, 3, or 4 for each question
          If you see 2 correct answers,
          choose the one with the lower number.
          Type 'quit' to end the test early.

INFO
    puts info
  end

  def grab_many_questions       # Called by the Multiple Choice Test
    sym_N_des_array = []        # Array that will be filled array containing 1 symbol and 1 description
    @multi_choice_array = []    # Array will be filled with 4 questions and 4 answers
    random_number = ""          # Random number between 0 and the length of the test
    random_array = []           # Stores the random numbers
    while random_array.length < 4               # Runs the loop until 4 unique random number are found
      random_number = rand(@one_test.length)    # Generates a random number
      if random_array.include?(random_number)   # Checks to see that each random number is uniquq
        random_number = rand(@one_test.length)  # If not unique another random number is generated
      else
        random_array.push(random_number)
        sym_N_des_array = @one_test.slice(random_number) # Picks 1 array from the larger array
        symbol = sym_N_des_array[0]                      # Pulls 1st value which is one the multiple choice
        description = sym_N_des_array[2]                 # Pulls 3rd value which is the question
        @multi_choice_array.push(description)            # Questions enter the array in 0th, 2nd, 4th, & 6th places
        @multi_choice_array.push(symbol)                 # Answers enter the array in 1st, 3rd, 5th, & 7th places
      end
    end
  end
  
  def pose_a_multi_choice_question
    print "(#{$n}.)\s" 
    print "[1] #{@multi_choice_array[1]} \t\s\s\s"    # The questions and answers entered the array as pairs
    print "[2] #{@multi_choice_array[3]} \t\s\s\s"    # The answers came second and so they occupy the odd 
    print "[3] #{@multi_choice_array[5]} \t\s\s\s"    # Index places of the multi_choice_array
    print "[4] #{@multi_choice_array[7]} \n \n"
    number_1_to_4 = rand(4)                 # Random number is equal to 0, 1, 2, or 3. 
    even_number = 2 * number_1_to_4         # Multiplied by 2 makes it even 0, 2, 4, or 6 and so it will select only a question
    @human_number = number_1_to_4 + 1        # Plus 1 makes the number understandable to for users
    @string_number = @human_number.to_s       # Converting to a string allows it to be compared to the user input
    print "Q: ",                            # A question prompt is printed
      @multi_choice_array[even_number],     # A questions is printed at random
      "\n",                                 
      "A: "                                 # An answer prompt is printed
  end

  def get_multi_choice_input
    @input = gets.chomp                     # Asks user for input
    if @input == 'quit'                     # Allows user to exit
      finish_test()                         
    elsif @input == 'skip'                  # Allows user to skip the question
      @name.grab_many_question  # Goes back a grabs a new question
    else 
      return @input
    end
  end  
    
  def evaluated_input   
    if @input == @string_number              # Answer is evaluated
      puts "Correct", ""
      $correct += 1                         # If correct, the counter is increased
    else
      print "Wrong, the answer was -> "
      puts @human_number, ""                 # If wrong, the correct answer is printed
    end
  end

  def finish_test
                                                    # Decreases the number counter by one so last question is iqnored
    results = "Finished - You got #{$correct} out of #{$n} answers right!"
    puts results                                               # Results are printed for the user
    Process.exit!(0)                                         # Multiple-Choice users are exited from the program
  end
end

puts "\n What is your name?"
     " > "
@name = gets.chomp
@name = Multiple_Choice_Test.new
@name.choose_a_test
@name.info_for_multi_choice_test
while $n <= 20
  @name.grab_many_questions
  @name.pose_a_multi_choice_question
  @name.get_multi_choice_input
  @name.evaluated_input
  $n += 1
end
$n -= 1
@name.finish_test