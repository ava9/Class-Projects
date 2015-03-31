function hangman(fname)
% Run the game hangman using words that are chosen from the file named by
% the string in fname.
% The game begins with the gallows drawn and dashes are displayed above the
% gallows to indicate the number of characters in the word. Each time the
% user guesses an incorrect letter, a body part is added to the figure. A
% round of the game ends when the user has made seven incorrect guesses or
% when the user has guessed the word correctly, whichever occurs first.
% Throughout the game, display the word status in the title area of the
% figure window and update the hangman figure as appropriate.
% When a round ends, display in the title area of the figure window a
% message indicating the word and whether the round is won or lost. In the
% Command Window, prompt the user about whether to play again.
% Words should not be repeated in a game; you can assume that the user
% chooses to play again far fewer times than there are available words.

count=0; %Used to update Hangman gallows drawing
win=0;
userInput=1; %Game is Played (0 to exit)
close all       %Close all figure windows
figure          %Start a figure window
figure('WindowStyle','docked') %Dock Window
axis off equal
hold on         %Keep all subsequent plot commands on same axes
x = [0, 4, 4, 0];
y = [4, 4, 3, 3];
fill(x,y,'k');
%create base rectange
plot([2, 2],[4, 8], 'k'); 
plot([2, 5],[8, 8], 'k');
plot([5, 5],[8, 7], 'k');
%draw lines to create the original gallows 
theta = linspace(0,2*pi);
cosVals = cos(theta); %x-values
sinVals = sin(theta); %y-values
%initialize the x and y values that will be used to make the head of
%hangman (circle)
while (userInput==1) %userInput wlil be asked at end of game to play again
    c=getWords(fname); %read popularWords.txt file
    [word, usedWords]=newWord(c, usedWords); %select a word
    clc
    fprintf('The number of characters in the word is %f',length(word));
    %clear screen and displayg the number of characters in the 
    %current word to be guessed
    for i=1:length(word) 
        %for loop to create dashes in title equal to length(word)
        str=str+'-';
    end
    title(str); %update title
    let = input('Guess a letter: ', 's');
    [found, tf] = findLetterInWord(let,word);
    if (found==1) %if letter is found
        for j=1:length(tf)
            if (tf(j)==1)
                str(j)=word(j); %update the title string
                win=win+1; %win count +1 (if win==length(word)) user wins
            end
        end
        title(str); %display the correctly guessed letters in title
    else
        count=count+1; %incorrect guess counter +1
        usedLetters=UsedLetters+let; %add let to UsedLetters
    end
    text(0,7,usedWords); %display already guessed letters
    if(win==length(word)) %user wins the game 
        str='WINNER! The word is '+word;
        title(str, 'FontSize', 16); %increase font to 16 for message
    end
    if(count==1) %1 incorrect guess
        fill(5+0.5*cosVals,6.5+0.5*sinVals,'k'); %plot head
    elseif(count==2) %2 incorrect guesses
        plot([5, 5],[6, 4.5], 'k'); %plot body
    elseif(count==3) %3 incorrect guesses
        plot([5, 5.5],[5.5, 5.25], 'k'); %plot right arm
    elseif(count==4) %4 incorrect guesses
        plot([5, 4.5],[5.5, 5.25], 'k'); %plot left arm
    elseif(count==5) %5 incorrect guesses
        plot([5, 5.5],[4.5, 4], 'k'); %plot right arm
    elseif(count==6) %6 incorrect guesses
        plot([5, 4.5],[4.5, 4], 'k'); %plot left arm
    else %7 incorrect guesses
        fill(5+0.5*cosVals,6.5+0.5*sinVals,'b');
        plot([5, 5],[6, 4.5], 'b');
        plot([5, 5.5],[5.5, 5.25], 'b');
        plot([5, 4.5],[5.5, 5.25], 'b');
        plot([5, 5.5],[4.5, 4], 'b');
        plot([5, 4.5],[4.5, 4], 'b');
        %plot entire hangman in blue and display that user has lost
        str='Uh Oh! The word is '+word;
        title(str, 'FontSize', 16); %increase font to 16 for message
        userInput = input('Enter 1 to play again, 0 to quit'); 
        %prompt userInput to play again or to exit
    end
end
hold off        %Subsequent plot command is shown on fresh axes
end