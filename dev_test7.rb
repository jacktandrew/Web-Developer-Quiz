puts 'A test of web developer knowledge!'

@n = 1
@explain = {}
@input = ""
@correct = 0

@all_the_tests = [
  [ #Regexp_questions =
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
    ['\\D','D for digit','capital negate! everything BUT digits', ['capital', 'negate', 'digit'] ],
    ['\\S','S for space','capital negate! everything BUT spaces', ['capital', 'negate', 'space'] ],
    ['\\W','W for word','capital negate! everything BUT words', ['capital', 'negate', 'word'] ],
    ['\\A','A for anchor','\\A anchors the start of a string', ['anchor', 'start', 'string'] ],
    ['\\z','z for anchor','\\z anchors the end of a string', ['anchor', 'end', 'string'] ],
    ['/^','caret','/^ anchors the start of lines', ['anchor', 'start', 'line'] ],
    ['$','dollar sign','$ anchors the end of lines', ['anchor', 'end', 'line'] ],
    ['\\b','b for boundary','\\b anchors to a word boundary', ['anchor', 'word', 'boundary'] ],
    ['()','parentheses','() group content', ['group', 'content'] ],
    ['|','pipe','| means "or"', ['or', 'or'] ],
    ['/','frontslash','starts and ends the regular expression', ['start', 'end', 'regular', 'expression'] ]
  ],
  [ #HTML_questions = 
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
    ['<html>','html','wraps everything', ['everything', 'wrap'] ],
    ['<style>','style','wraps text written in CSS', ['CSS', 'wrap'] ],
    ['<title>','title','assigns a title to the window', ['window', 'title'] ],
    ['id=','identification','marks 1 element so CSS or JS can select it', ['element', 'select', 'mark'] ],
    ['class=','class','marks many element that can all be selected by CSS or JS', ['element', 'select', 'mark', 'many'] ],
    ['src=','source','points to the location of an internal file', ['point', 'location', 'file'] ],
    ['href=','hypertext reference','points to the location of an external link', ['point','location','external','link'] ]
  ],
  [ #Symbols_questions = 
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
    ['<!--','comment','use this ONLY in HTML'],
    ['//','comment','use this ONLY in CSS or JavaScript'],
    ['&','ampersand','used before strange characters'],
    ['+','plus sign','used in math AND to concatenate strings']
  ]
]
def choose_a_test
  puts 'Do you want the (H)TML, (S)YMBOLS, or (R)EGEXP test?'
  print '> '
  choice_input = gets.chomp.capitalize
  c_input = choice_input[0]
    
  if c_input == 'R'
    array = @all_the_tests[0]
    subject = "RegExp"
    
  elsif c_input == 'H'
    array = @all_the_tests[1]
    subject = "HTML"
  
  elsif c_input == 'S'
    array = @all_the_tests[2]
    subject = "Symbols"
  else
    puts "I didn't understand..."
    choose_a_test()
  end

  @questions = array

  puts 'Do you want (F)lashcards or (M)ultiple-Choice'
  choice_input = gets.chomp.capitalize
  c_input = choice_input[0]
  
  if c_input == 'F'
    form = 'Flash Card Test'
    puts "", "<>{ () }<>  " + subject + ' ' + form + " <>{ () }<>", ""
    flashcard_test()
  elsif c_input == 'M'
    form = 'Multiple Choice Test'
    puts "", "<>{ () }<>  " + subject + ' ' + form + " <>{ () }<>", ""
    multi_choice_test()
  else
    puts "I didn't understand..."
    choose_a_test()
  end
end

def info_for_test
  puts "In this test you will be asked questions"
  puts "as well as asked to explain your answers.",
       "\n"
  puts "For each, you will grade your answers and explainations"
  puts "and let the program know if you got it right or wrong.",
       "\n"
  puts "Type 'quit' to end the test early" 
  puts "Type 'skip' to advance to the next question"
  puts "Type 'help' to see these instructions again",
       "\n"
end

def grab_a_question
  if @questions.length >= 1
    if @input != "quit"
    random_number = rand(@questions.length)
    @aQuestion = @questions.slice!(random_number)
    pose_a_question()
    else
      finish_test()
    end
  else 
    finish_test()
  end
end

def grab_many_questions
  @z = 0
  @multi_choice_array = []
  
  while @n < 20
    if @input == "quit"
      finish_test()
    else
      while @z < 4                                    # Runs the loop 4 times
        random_number = rand(@questions.length)       # Generates a random number based on the total # of questions
        q_array = @questions.slice(random_number)     # Picks that question array from the larger array
        q_value = q_array[0]                        #
        a_value = q_array[2]
        @multi_choice_array.push(a_value)
        @multi_choice_array.push(q_value)           #
        @z += 1
      end
    end
    @n += 1
    pose_a_multi_choice_question()
  end
end


def pose_a_question
  print "#{@n}. \s \s" + @aQuestion.first + "\s \s > "
  @n += 1
  get_flashcard_input()
  @explain[@aQuestion[0]] = @input
  puts "Your answer should be something like...", " -> #{@aQuestion[1]}"
  get_explaination()
end

def pose_a_multi_choice_question
  print "(1) #{@multi_choice_array[1]} \s\s\t"
  print "(2) #{@multi_choice_array[3]} \s\s\t" 
  print "(3) #{@multi_choice_array[5]} \s\s\t"
  print "(4) #{@multi_choice_array[7]} \n"

  answer_number = rand(4)                               # 0.1.2.3.
  ask_number = 2 * answer_number                        # 0 - 2 - 4 - 6
  adj_number = answer_number + 1
  string_number = adj_number.to_s
  print "Q: ", @multi_choice_array[ask_number], "\n"
  print "A: "
  get_multi_choice_input()                                           # 1 - 2 - 3 - 4
  if @input == string_number
    puts "Correct", ""
    @correct += 1
  else
    print "Wrong, the answer was -> "
    puts adj_number, ""
  end
  grab_many_questions()
end

def get_multi_choice_input
  @input = gets.chomp
  if @input == 'quit'
    @n -= 1
    finish_test()
  elsif @input == 'skip'
    grab_a_question()
  elsif @input == 'help'
    info_for_test()
  else
    return @input
  end
end

def get_flashcard_input
  @input = gets.chomp
  if @input == 'quit'
    @n -= 1
    finish_test()
  elsif @input == 'skip'
    grab_a_question()
  elsif @input == 'help'
    info_for_test()
  else
    @explain[@aQuestion[0]] = @input
  end
end

def get_explaination
  puts "Please write an explaination : "
  print "> "
  get_flashcard_input()
  puts "Your explaination should be something like...", " -> #{@aQuestion[2]}"
  self_correct()
  grab_a_question()
end

def self_correct
  print "correct?  y / n  ", " > "
  self_correct = gets.chomp
  if self_correct == 'y'
    puts "good job!", ""
    @correct += 1
  elsif self_correct == 'n'
    @questions.push(@aQuestion)
    print "ok we put that one back so you can try it again later",""
  else
    puts "sorry I didn't understand that..."
    self_correct()
  end
end

def finish_test
  @n -= 1
  results = "Finished! You got #{@correct} out of #{@n} answers right!"
  puts results
  puts "Do you want to save these results?  y / n"
  want_to_save = gets.chomp
  if want_to_save == 'y'  
    @explain['results'] = results
    the_time = Time.now.to_i
    filename = "answers-" + the_time.to_s + ".rb"
    target = File.open(filename, 'w')
    target.write(@explain)
    target.close()
    puts "ok, your results were saved"
  else
    puts "ok, your results were erased"
  end
  Process.exit!(0)
end

def flashcard_test
  info_for_test()
  grab_a_question()
  pose_a_question()
  finish_test()
end

def multi_choice_test
  info_for_test()
  grab_many_questions()
  pose_a_multi_choice_question()
end

choose_a_test()