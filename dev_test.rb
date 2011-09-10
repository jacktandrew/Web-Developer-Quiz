title = <<TITLE

  A test of web developer knowledge

TITLE
print title

@n = 1                      # A variable that counts and displays which number you are on for the Flashcard Test
@explain = {}               # A hash stores the questions and explainations for the Flashcard Test 
@input = ""                 # A variable is used throughout both tests for user input
@correct = 0                # A variable that counts the correct answers for both tests
@one_test = []              # A array that will be populated with questions from @all_the_tests
@c = 0                      # A variable that counts the multiple choices answers starting at 0 and going to 3
@multi_choice_array = []    # An empty array that will be filled with multiple 4 choice answers

@all_the_tests = [          # An array that contains all three tests
                            # A symbol or tag at [0]
                            # The name of the symbol or tag [1] 
                            # A description of the at [2]
                            # and a sub-array of keywords [3] 
                            # Later I may make a function to evalute the 
                            # Explainations but I've left that for another day
                            # for now [3] is not used

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

def choose_a_test                                               
  puts 'Do you want the (H)TML, (S)YMBOLS, or (R)EGEXP test?'
  print '> '
  choice_input = gets.chomp.capitalize              # User input is received and capitalized for uniformity
  c_input = choice_input[0]                         # Only the first letter of user input is stored 
                                                     
  if c_input == 'R'                                 # If only checks the string's 1st letter was R 
    @one_test = @all_the_tests[0]                   # The chosen sub-array is pull by it's index number
    subject = "RegExp"                              # A string is supplied for the title
    
  elsif c_input == 'H'                              # 'h', 'H', 'HTML' or even 'Hello' are all 'true'
    @one_test = @all_the_tests[1]
    subject = "HTML"
  
  elsif c_input == 'S'
    @one_test = @all_the_tests[2]
    subject = "Symbols"
  else                                              # Invalid input will result in an 
    puts "I didn't understand..."                   # An easy to read error message
    choose_a_test()                                 # and the function is called again
  end

  puts "\n Do you want (F)lashcards or (M)ultiple-Choice"
  print '> '
  choice_input = gets.chomp.capitalize              
  c_input = choice_input[0]                         # Again only the first letter of a input string is evaluated
  
  if c_input == 'F'
    form = 'Flash Card Test'                                            
    puts "\n\s <>{ () }<>  " + subject + ' ' + form + " <>{ () }<> \n"  # A decorative title bar is created
    flashcard_test()
  elsif c_input == 'M'
    form = 'Multiple Choice Test'
    puts "\n\s <>{(| )}<>  " + subject + ' ' + form + " <>{( |)}<> \n"
    multi_choice_test()
  else
    puts "I didn't understand..."
    choose_a_test()
  end
end

def info_for_flashcard_test
  info = <<INFO
  
      This test will ask you questions 
      and ask you to explain your answers.
      You will grade your explainations.
  
      Type 'quit' to end the test early
      Type 'skip' to advance to the next question
      Type 'help' to see these instructions again
       
INFO
  puts info
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

def grab_a_question                                   # Called by the Flashcard Test
  if @one_test.length >= 1                            # A checks to see if any questions have yet to be asked
    random_number = rand(@one_test.length)            # Random number is generated 
    @aQuestion = @one_test.slice!(random_number)      # 1 question is removed from the array at random and returned
    pose_a_question()                                 # The next function is called to pose the selected question
  end
end

def grab_many_questions       # Called by the Multiple Choice Test
  sym_N_des_array = []        # Array that will be filled array containing 1 symbol and 1 description
  @multi_choice_array = []    # Array will be filled with 4 questions and 4 answers
  random_number = ""          # Random number between 0 and the length of the test
  random_array = []
  while @n <= 20                               # Runs the function 20 times asking 20 questions
    while random_array.length < 4           # Runs the loop until 4 unique random number are found
      random_number = rand(@one_test.length)
      if random_array.include?(random_number)
        random_number = rand(@one_test.length)
      else
        random_array.push(random_number)
        sym_N_des_array = @one_test.slice(random_number) # Picks 1 array from the larger array
        symbol = sym_N_des_array[0]                      # Pulls 1st value which is one the multiple choice
        description = sym_N_des_array[2]                 # Pulls 3rd value which is the question
        @multi_choice_array.push(description)            # Questions enter the array in 0th, 2nd, 4th, & 6th places
        @multi_choice_array.push(symbol)                 # Answers enter the array in 1st, 3rd, 5th, & 7th places
      end
    end
    pose_a_multi_choice_question()
  end
  finish_test()
end


def pose_a_question
  print "#{@n}. \s \s" + @aQuestion.first + "\s \s > "  # The question number and question are printed
  @n += 1                                               # The number counter is increased by 1
  get_flashcard_input()                                 # The user input is process and returned
  puts "Your answer should be something like...",       # 
       "\n -> #{@aQuestion[1]} \n \n"                           # The stock answer is displayed
  get_explaination()
end

def pose_a_multi_choice_question
  print "(#{@n}.)\s" 
  print "[1] #{@multi_choice_array[1]} \t\s\s\s"    # The questions and answers entered the array as pairs
  print "[2] #{@multi_choice_array[3]} \t\s\s\s"    # The answers came second and so they occupy the odd 
  print "[3] #{@multi_choice_array[5]} \t\s\s\s"    # Index places of the multi_choice_array
  print "[4] #{@multi_choice_array[7]} \n \n"
  @n += 1
  number_1_to_4 = rand(4)                 # Random number is equal to 0, 1, 2, or 3. 
  even_number = 2 * number_1_to_4         # Multiplied by 2 makes it even 0, 2, 4, or 6 and so it will select only a question
  human_number = number_1_to_4 + 1        # Plus 1 makes the number understandable to for users
  string_number = human_number.to_s       # Converting to a string allows it to be compared to the user input
  print "Q: ",                            # A question prompt is printed
    @multi_choice_array[even_number],     # A questions is printed at random
    "\n",                                 
    "A: "                                 # An answer prompt is printed
  get_multi_choice_input()                # The user will select a either 1, 2, 3, or 4
  if @input == string_number              # Answer is evaluated
    puts "Correct", ""
    @correct += 1                         # If correct, the counter is increased
  else
    print "Wrong, the answer was -> "
    puts human_number, ""                 # If wrong, the correct answer is printed
  end
  
  grab_many_questions()                   # The grab_many_questions function is called
end                                       # Causing the a new cycle to begin

def get_multi_choice_input
  @input = gets.chomp                     # Asks user for input
  if @input == 'quit'                     # Allows user to exit
    @n -= 1                               # Decreases counter by one so last question is not counted against the user
    finish_test()                         
  elsif @input == 'skip'                  # Allows user to skip the question
    grab_many_question()                  # Goes back a grabs a new question
  else 
    return @input
  end
end

def get_flashcard_input
  @input = gets.chomp                     # Asks for user input store in @input variable
  if @input == 'quit'                     # Allows the user to end the test early
    @n -= 1                               # Decreases counter by one so last question is not counted against the user
    finish_test()                         #
  elsif @input == 'skip'                  # Allows user to skip the question
    grab_a_question()                     # Goes back a grabs a new question
  elsif @input == 'help'                  # Allows the user to reread the instructions
    info_for_flashcard_test()             # Prints the instructions again
  else                                    #
    @explain[@aQuestion[0]] = @input      # Stores the user's explaination in a hash called @explain
    return @input                         #
  end                                     # The question is the 'key' of the hash
end                                       # and the user input is the 'value' of the hash

def get_explaination
  puts "\n Please write an explaination : "                     # Asks the user for input
  print "> "
  get_flashcard_input()                                      # Evaluates input to check if user wants help, to skip, or quit 
  puts "\n Your explaination should be something like... \n",   # Provides an example explainations
       "\n -> #{@aQuestion[2]}"
  self_correct()                                             # Give the user a chance to self-correct
end

def self_correct
  print "\n", "correct?  y / n   > "                     # Asks the user if his/her answer was correct
  self_correct = gets.chomp                                  # Receives the user input
  if self_correct == 'y'                                     # And evaluates
    puts "good job! \n \n"                                      # Print 'good job' 
    @correct += 1                                            # Increase correct counter by 1
  elsif self_correct == 'n'
    @one_test.push(@aQuestion)                               # If 'n' question pushed back into the test
    puts "\n We'll put that one back so you can try it again later \n"
  else
    puts "sorry I didn't understand that..."
    self_correct()                                           # Catches bad input asks the question again
  end
  grab_a_question()                                          # Goes back a grabs a new question
end

def finish_test
  @n -= 1                                                    # Decreases the number counter by one so last question is iqnored
  results = "Finished - You got #{@correct} out of #{@n} answers right!"
  puts results                                               # Results are printed for the user
  if @explain.length < 1                                     # Multiple-Choice doens't have explainations so @explain hash is 0 
    Process.exit!(0)                                         # Multiple-Choice users are exited from the program
  else
    puts "Do you want to save these results?  y / n"         # Flashcard users are asked if the want to save results
    want_to_save = gets.chomp
    if want_to_save == 'y'  
      @explain['results'] = results                          # 1 more hash value is add containing the results
      the_time = Time.now.to_i                               # Current time detected and decimal of seconds removed
      filename = "answers-" + the_time.to_s + ".rb"          # Time is included into the filename so each is unique
      folder = Dir.chdir('results')                          # Directory is changed to the 'results' directory
      target = File.open(filename, 'w')                      # A file is created in the results folder
      target.write(@explain)                                 # @explain hash is written to file
      target.close()                                         # and the file is closed
      puts "ok, your results were saved"
    else
      puts "ok, your results were erased"
    end
  end
  Process.exit!(0)                                           # User is exited from the program
end

def flashcard_test
  info_for_flashcard_test()
  grab_a_question()
  pose_a_question()
  finish_test()
end

def multi_choice_test
  info_for_multi_choice_test()
  grab_many_questions()
  pose_a_multi_choice_question()
end

choose_a_test()