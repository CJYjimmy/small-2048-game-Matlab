%Skeleton function

function play2048

%Establish figure: You should remove the menu and toolbar, turn off the
%the number title, and set the title the figure 2048
global maxS;
if isempty(maxS)
    maxS = '0';
end
figure('Name','2048', 'Color', [0.5 0.5 0.5], 'NumberTitle','off','MenuBar','none',...
    'ToolBar','none','Position',[420,10,545,750]);
f=gcf;
mainTitle = uicontrol(f,'Style','text', 'BackgroundColor',[0.5 0.5 0.5],'FontSize', 50, ...
                'Position', [212.5, 580, 120, 55], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String','2048');
startBtn = uicontrol(f, 'Style','pushbutton','String','Start a New Game', ...
                     'FontSize',15, 'Position', [197.5 520 150 40], ...
                     'Interruptible', 'off');
startBtn.Callback = @beginGame;
colorBtn = uicontrol(f, 'Style','pushbutton','String','Setting Color', ...
                     'FontSize',15, 'Position', [197.5 460 150 40], ...
                     'Interruptible', 'off');
colorBtn.Callback = @setColor;

quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [197.5 400 150 40], ...
                     'Interruptible', 'off');
quitBtn.Callback = @quitGame;


wait = waitforbuttonpress;
while wait ~= 0
   wait = waitforbuttonpress; 
end

end

function beginGame(src,event)
%Display the title, the score, and create the tiles in the figure
global maxS;
if isempty(maxS)
    maxS = '0';
end

f = gcf;
childs = allchild(f);
l = length(childs);
for k = 1:l
    delete(childs(k));
end
color = f.Color;
ps = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 15, ...
                'Position', [180, 640, 360, 60], 'ForegroundColor', 'k', ...
                'HorizontalAlignment', 'left','String','If you click any place other than buttons, you need to double click the Pause/Play button in order to continue the game! (^v^)');
title = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 50, ...
                'Position', [40, 580, 120, 55], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String','2048');
scoreP = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 50, ...
                'Position', [180, 580, 340, 55], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'right','String','0');
            
maxScoreT = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 35, ...
                'Position', [20, 700, 150, 50], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String','Highest Score');
maxScore = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 45, ...
                'Position', [170, 700, 150, 50], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String',maxS);
            
tile_4_1 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [25,55,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_4_2 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [150,55,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_4_3 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [275,55,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_4_4 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [400,55,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_3_1 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [25,180,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_3_2 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [150,180,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_3_3 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [275,180,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_3_4 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [400,180,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_2_1 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [25,305,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_2_2 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [150,305,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_2_3 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [275,305,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_2_4 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [400,305,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_1_1 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [25,430,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_1_2 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [150,430,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_1_3 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [275,430,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');
tile_1_4 = uicontrol(f,'Style','text', 'BackgroundColor','white','FontSize', 60, ...
                'Position', [400,430,120,120], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'center');

% Create a quit button (it can use the callback function quitGame provided
% below)

quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [420 5 100 40], ...
                     'Interruptible', 'off');
quitBtn.Callback = @quitGame;

pauseBtn = uicontrol(f, 'Style','pushbutton','String','Pause/Play', ...
                     'FontSize',15, 'Position', [30 5 100 40], ...
                     'Interruptible', 'off');
pauseBtn.Callback = @pauseGame;

%Initialize an array to keep track of your values as the game is played 
global trackValue;
global allTiles;
trackValue = [0 0 0 0;0 0 0 0; 0 0 0 0;0 0 0 0];
allTiles =[tile_1_1,tile_1_2,tile_1_3,tile_1_4;
    tile_2_1,tile_2_2,tile_2_3,tile_2_4;
    tile_3_1,tile_3_2,tile_3_3,tile_3_4;
    tile_4_1,tile_4_2,tile_4_3,tile_4_4];

%Update the display to show the beginning board with the new tiles
trackValue = tileGenerator(trackValue);
trackValue = tileGenerator(trackValue);
[row col] = find(trackValue);
for k = 1:length(row)
    num = trackValue(row(k),col(k));
    tile = allTiles(row(k),col(k));
    if num == 2
        tile.String = '2';
        tile.BackgroundColor = [0.9 0.9 0.9];
    elseif num == 4
        tile.String = '4';
        tile.BackgroundColor = [0.9 0.9 0.8];
    end
end
global score;
score = 0;
global play;
play = true;
while play

    %Pause the program to wait for a user input
    %Determine the user input, and call the boardSlider with the
    %appropriate direction
    copy = trackValue;
    while(all(copy == trackValue))
        w = waitforbuttonpress;
        if w == 1
            Key = get(gcf,'CurrentKey');
            switch num2str(Key)
                case 'uparrow'
                    d = 'up';
                    [trackValue, score] = boardSlider(trackValue,d, score);
                case 'downarrow'
                    d = 'down';
                    [trackValue, score] = boardSlider(trackValue,d, score);
                case 'rightarrow'
                    d = 'right';
                    [trackValue, score] = boardSlider(trackValue,d, score);
                case 'leftarrow'
                    d = 'left';
                    [trackValue, score] = boardSlider(trackValue,d, score);
            end
        else
            copy = -1;
            play = false;
        end
    end
    %Update the tiles in the figure based on the array
    if play
 
    [row col] = find(trackValue);
    for k = 1:length(row)
        num = trackValue(row(k),col(k));
        tile = allTiles(row(k),col(k));
        if num == 2
            tile.String = '2';
            tile.BackgroundColor = [0.9 0.9 0.9];
        elseif num == 4
            tile.String = '4';
            tile.BackgroundColor = [0.9 0.9 0.8];
        elseif num == 8
            tile.String = '8';
            tile.BackgroundColor = [0.9 0.7 0.7];
        elseif num == 16
            tile.String = '16';
            tile.BackgroundColor = [0.9 0.6 0.6];
        elseif num == 32
            tile.String = '32';
            tile.BackgroundColor = [0.9 0.5 0.5];
        elseif num == 64
            tile.String = '64';
            tile.BackgroundColor = [0.9 0.4 0.4];
        elseif num == 128
            tile.String = '128';
            tile.BackgroundColor = [0.9 0.3 0.3];
        elseif num == 256
            tile.String = '256';
            tile.BackgroundColor = [0.9 0 0.9];
        elseif num == 512
            tile.String = '512';
            tile.BackgroundColor = [0.9 0 0.6];
        elseif num == 1024
            tile.String = '1024';
            tile.BackgroundColor = [0.9 0 0.3];
        elseif num == 2048
            tile.String = '2048';
            tile.BackgroundColor = [0.9 0 0];
        else
            tile.String = num2str(num);
            tile.BackgroundColor = [1 0 0];
        end
    end
    
    mask = trackValue == 0;
    [row2 col2] = find(mask);
    for i = 1:length(row2)
        tile = allTiles(row2(i),col2(i));
        tile.String = '';
        tile.BackgroundColor = 'white';
    end 
    
    
    %generate a new tile if the array changed when passed
    %through boardSlider with the given direction
    copy3 = trackValue;
    trackValue = tileGenerator(trackValue);
    maskForNewTile = copy3 ~= trackValue;
    [row3 col3] = find(maskForNewTile);
    num = trackValue(row3,col3);
    tile = allTiles(row3,col3);
    pause(0.2);
    if num == 2
        tile.String = '2';
        tile.BackgroundColor = [0.9 0.9 0.9];
    elseif num == 4
        tile.String = '4';
        tile.BackgroundColor = [0.9 0.9 0.8];
    end
    
    scoreP.String = num2str(score);
    maxScore.String = maxS;
    
    %Check to see if Game Over
        %the game is over if there are no empty spots on the board and
        %there are no avaliable moves to be made (no adjacent tiles are
        %equal
        %
        %If game is over, how do you terminate the program/game?
        %
        %Display game over screen and update leaderboard
    copy2 = trackValue;
    [result1, ~] = boardSlider(copy2,'up', score);
    [result2, ~] = boardSlider(copy2,'down', score);
    [result3, ~] = boardSlider(copy2,'right', score);
    [result4, ~] = boardSlider(copy2,'left', score);
    check = length(row2) == 1;
    if check & all(result1 == trackValue) & all(result2 == trackValue) & all(result3 == trackValue) & all(result4 == trackValue)
        if str2num(maxS) < str2num(scoreP.String)
            maxS = scoreP.String;
        end
        childs = allchild(f);
        l = length(childs);
        for k = 1:l
            delete(childs(k));
        end
        over1 = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 60, ...
                'Position', [0, 450, 272.5, 80], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'right','String','Game');
        pause(1.5);
        over2 = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 60, ...
                'Position', [272.5, 450, 272.5, 80], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String',' Over!');
        play = false;
        pause(1.5);
        mainBtn = uicontrol(f, 'Style','pushbutton','String','Main Page', ...
                     'FontSize',15, 'Position', [197.5 350 150 40], ...
                     'Interruptible', 'off');
        mainBtn.Callback = @mainPage;
        replayBtn = uicontrol(f, 'Style','pushbutton','String','Play Again', ...
                     'FontSize',15, 'Position', [197.5 290 150 40], ...
                     'Interruptible', 'off');
        replayBtn.Callback = @beginGame;
        
        quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [197.5 230 150 40], ...
                     'Interruptible', 'off');
        quitBtn.Callback = @quitGame;
        
        wait = waitforbuttonpress;
        while wait ~= 0
            wait = waitforbuttonpress; 
        end
        
    end
    end
end
end

function setColor(src,event)
f = gcf;
childs = allchild(f);
l = length(childs);
for k = 1:l
    delete(childs(k));
end

redBtn = uicontrol(f, 'Style','pushbutton','String','Red', ...
                     'FontSize',15, 'Position', [197.5 460 150 40], ...
                     'Interruptible', 'off');
redBtn.Callback = @red;
blueBtn = uicontrol(f, 'Style','pushbutton','String','Blue', ...
                     'FontSize',15, 'Position', [197.5 400 150 40], ...
                     'Interruptible', 'off');
blueBtn.Callback = @blue;
yellowBtn = uicontrol(f, 'Style','pushbutton','String','Yellow', ...
                     'FontSize',15, 'Position', [197.5 340 150 40], ...
                     'Interruptible', 'off');
yellowBtn.Callback = @yellow;
grayBtn = uicontrol(f, 'Style','pushbutton','String','Gray (original color)', ...
                     'FontSize',15, 'Position', [197.5 280 150 40], ...
                     'Interruptible', 'off');
grayBtn.Callback = @gray;
end

function red(src,event)
f = gcf;
childs = allchild(f);
l = length(childs);
for k = 1:l
    delete(childs(k));
end
f.Color = 'r';
mainTitle = uicontrol(f,'Style','text', 'BackgroundColor','r','FontSize', 50, ...
                'Position', [212.5, 580, 120, 55], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String','2048');
startBtn = uicontrol(f, 'Style','pushbutton','String','Start a New Game', ...
                     'FontSize',15, 'Position', [197.5 520 150 40], ...
                     'Interruptible', 'off');
startBtn.Callback = @beginGame;
colorBtn = uicontrol(f, 'Style','pushbutton','String','Setting Color', ...
                     'FontSize',15, 'Position', [197.5 460 150 40], ...
                     'Interruptible', 'off');
colorBtn.Callback = @setColor;

quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [197.5 400 150 40], ...
                     'Interruptible', 'off');
quitBtn.Callback = @quitGame;

wait = waitforbuttonpress;
while wait ~= 0
   wait = waitforbuttonpress; 
end
end

function yellow(src,event)
f = gcf;
childs = allchild(f);
l = length(childs);
for k = 1:l
    delete(childs(k));
end
f.Color = 'y';
mainTitle = uicontrol(f,'Style','text', 'BackgroundColor','y','FontSize', 50, ...
                'Position', [212.5, 580, 120, 55], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String','2048');
startBtn = uicontrol(f, 'Style','pushbutton','String','Start a New Game', ...
                     'FontSize',15, 'Position', [197.5 520 150 40], ...
                     'Interruptible', 'off');
startBtn.Callback = @beginGame;
colorBtn = uicontrol(f, 'Style','pushbutton','String','Setting Color', ...
                     'FontSize',15, 'Position', [197.5 460 150 40], ...
                     'Interruptible', 'off');
colorBtn.Callback = @setColor;

quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [197.5 400 150 40], ...
                     'Interruptible', 'off');
quitBtn.Callback = @quitGame;

wait = waitforbuttonpress;
while wait ~= 0
   wait = waitforbuttonpress; 
end
end

function blue(src,event)
f = gcf;
childs = allchild(f);
l = length(childs);
for k = 1:l
    delete(childs(k));
end
f.Color = 'b';
mainTitle = uicontrol(f,'Style','text', 'BackgroundColor','b','FontSize', 50, ...
                'Position', [212.5, 580, 120, 55], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String','2048');
startBtn = uicontrol(f, 'Style','pushbutton','String','Start a New Game', ...
                     'FontSize',15, 'Position', [197.5 520 150 40], ...
                     'Interruptible', 'off');
startBtn.Callback = @beginGame;
colorBtn = uicontrol(f, 'Style','pushbutton','String','Setting Color', ...
                     'FontSize',15, 'Position', [197.5 460 150 40], ...
                     'Interruptible', 'off');
colorBtn.Callback = @setColor;

quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [197.5 400 150 40], ...
                     'Interruptible', 'off');
quitBtn.Callback = @quitGame;

wait = waitforbuttonpress;
while wait ~= 0
   wait = waitforbuttonpress; 
end
end

function gray(src,event)
f = gcf;
childs = allchild(f);
l = length(childs);
for k = 1:l
    delete(childs(k));
end
f.Color = [0.5 0.5 0.5];
mainTitle = uicontrol(f,'Style','text', 'BackgroundColor',[0.5 0.5 0.5],'FontSize', 50, ...
                'Position', [212.5, 580, 120, 55], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String','2048');
startBtn = uicontrol(f, 'Style','pushbutton','String','Start a New Game', ...
                     'FontSize',15, 'Position', [197.5 520 150 40], ...
                     'Interruptible', 'off');
startBtn.Callback = @beginGame;
colorBtn = uicontrol(f, 'Style','pushbutton','String','Setting Color', ...
                     'FontSize',15, 'Position', [197.5 460 150 40], ...
                     'Interruptible', 'off');
colorBtn.Callback = @setColor;

quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [197.5 400 150 40], ...
                     'Interruptible', 'off');
quitBtn.Callback = @quitGame;

wait = waitforbuttonpress;
while wait ~= 0
   wait = waitforbuttonpress; 
end
end

function mainPage(src,event)
f = gcf;
childs = allchild(f);
l = length(childs);
for k = 1:l
    delete(childs(k));
end
color = f.Color;
mainTitle = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 50, ...
                'Position', [212.5, 580, 120, 55], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String','2048');
startBtn = uicontrol(f, 'Style','pushbutton','String','Start a New Game', ...
                     'FontSize',15, 'Position', [197.5 520 150 40], ...
                     'Interruptible', 'off');
startBtn.Callback = @beginGame;
colorBtn = uicontrol(f, 'Style','pushbutton','String','Setting Color', ...
                     'FontSize',15, 'Position', [197.5 460 150 40], ...
                     'Interruptible', 'off');
colorBtn.Callback = @setColor;

quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [197.5 400 150 40], ...
                     'Interruptible', 'off');
quitBtn.Callback = @quitGame;

wait = waitforbuttonpress;
while wait ~= 0
   wait = waitforbuttonpress; 
end
end

function quitGame(src,event) % fill in the two inputs for a callback function

    % does anything extra you would like to put in
    
    % closes the figure
f = gcf;
close(f);

end

function pauseGame(src,event)
global maxS;
if isempty(maxS)
    maxS = '0';
end

f = gcf;
childs = allchild(f);
delete(childs(1));
pauseBtn = uicontrol(f, 'Style','pushbutton','String','Pause/Play', ...
                     'FontSize',15, 'Position', [30 5 100 40], ...
                     'Interruptible', 'off');
pauseBtn.Callback = @playGame;
wait = waitforbuttonpress;
while wait ~= 0
   wait = waitforbuttonpress;
end
end

function playGame(src,event)
global maxS;
if isempty(maxS)
    maxS = '0';
end

f = gcf;
childs = allchild(f);
delete(childs(1));
pauseBtn = uicontrol(f, 'Style','pushbutton','String','Pause/Play', ...
                     'FontSize',15, 'Position', [30 5 100 40], ...
                     'Interruptible', 'off');
pauseBtn.Callback = @pauseGame;
global allTiles;
global trackValue;
global score;
global play;
play = true;
childs = allchild(f);
l = length(childs);
while play

    %Pause the program to wait for a user input
    %Determine the user input, and call the boardSlider with the
    %appropriate direction
    copy = trackValue;
    while(all(copy == trackValue))
        w = waitforbuttonpress;
        if w == 1
            Key = get(gcf,'CurrentKey');
            switch num2str(Key)
                case 'uparrow'
                    d = 'up';
                    [trackValue, score] = boardSlider(trackValue,d, score);
                case 'downarrow'
                    d = 'down';
                    [trackValue, score] = boardSlider(trackValue,d, score);
                case 'rightarrow'
                    d = 'right';
                    [trackValue, score] = boardSlider(trackValue,d, score);
                case 'leftarrow'
                    d = 'left';
                    [trackValue, score] = boardSlider(trackValue,d, score);
            end
        else
            copy = -1;
            play = false;
        end
    end
    %Update the tiles in the figure based on the array
    if play
 
    [row col] = find(trackValue);
    for k = 1:length(row)
        num = trackValue(row(k),col(k));
        tile = allTiles(row(k),col(k));
        if num == 2
            tile.String = '2';
            tile.BackgroundColor = [0.9 0.9 0.9];
        elseif num == 4
            tile.String = '4';
            tile.BackgroundColor = [0.9 0.9 0.8];
        elseif num == 8
            tile.String = '8';
            tile.BackgroundColor = [0.9 0.7 0.7];
        elseif num == 16
            tile.String = '16';
            tile.BackgroundColor = [0.9 0.6 0.6];
        elseif num == 32
            tile.String = '32';
            tile.BackgroundColor = [0.9 0.5 0.5];
        elseif num == 64
            tile.String = '64';
            tile.BackgroundColor = [0.9 0.4 0.4];
        elseif num == 128
            tile.String = '128';
            tile.BackgroundColor = [0.9 0.3 0.3];
        elseif num == 256
            tile.String = '256';
            tile.BackgroundColor = [0.9 0 0.9];
        elseif num == 512
            tile.String = '512';
            tile.BackgroundColor = [0.9 0 0.6];
        elseif num == 1024
            tile.String = '1024';
            tile.BackgroundColor = [0.9 0 0.3];
        elseif num == 2048
            tile.String = '2048';
            tile.BackgroundColor = [0.9 0 0];
        else
            tile.String = num2str(num);
            tile.BackgroundColor = [1 0 0];
        end
    end
    
    mask = trackValue == 0;
    [row2 col2] = find(mask);
    for i = 1:length(row2)
        tile = allTiles(row2(i),col2(i));
        tile.String = '';
        tile.BackgroundColor = 'white';
    end 
    
    
    %generate a new tile if the array changed when passed
    %through boardSlider with the given direction
    copy3 = trackValue;
    trackValue = tileGenerator(trackValue);
    maskForNewTile = copy3 ~= trackValue;
    [row3 col3] = find(maskForNewTile);
    num = trackValue(row3,col3);
    tile = allTiles(row3,col3);
    pause(0.2);
    if num == 2
        tile.String = '2';
        tile.BackgroundColor = [0.9 0.9 0.9];
    elseif num == 4
        tile.String = '4';
        tile.BackgroundColor = [0.9 0.9 0.8];
    end
    scoreP = childs(l-2);
    scoreP.String = num2str(score);
    childs(l-4).String = maxS;
    
    
    %Check to see if Game Over
        %the game is over if there are no empty spots on the board and
        %there are no avaliable moves to be made (no adjacent tiles are
        %equal
        %
        %If game is over, how do you terminate the program/game?
        %
        %Display game over screen and update leaderboard
    copy2 = trackValue;
    [result1, ~] = boardSlider(copy2,'up', score);
    [result2, ~] = boardSlider(copy2,'down', score);
    [result3, ~] = boardSlider(copy2,'right', score);
    [result4, ~] = boardSlider(copy2,'left', score);
    check = length(row2) == 1;
    if check & all(result1 == trackValue) & all(result2 == trackValue) & all(result3 == trackValue) & all(result4 == trackValue)
        if str2num(maxS) < str2num(scoreP.String)
            maxS = scoreP.String;
        end
        for k = 1:l
            delete(childs(k));
        end
        color = f.Color;
        over1 = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 60, ...
                'Position', [0, 450, 272.5, 80], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'right','String','Game');
        pause(1.5);
        over2 = uicontrol(f,'Style','text', 'BackgroundColor',color,'FontSize', 60, ...
                'Position', [272.5, 450, 272.5, 80], 'ForegroundColor', 'white', ...
                'HorizontalAlignment', 'left','String',' Over!');
        play = false;
        pause(1.5);
        mainBtn = uicontrol(f, 'Style','pushbutton','String','Main Page', ...
                     'FontSize',15, 'Position', [197.5 350 150 40], ...
                     'Interruptible', 'off');
        mainBtn.Callback = @mainPage;
        replayBtn = uicontrol(f, 'Style','pushbutton','String','Play Again', ...
                     'FontSize',15, 'Position', [197.5 290 150 40], ...
                     'Interruptible', 'off');
        replayBtn.Callback = @beginGame;
        
        quitBtn = uicontrol(f, 'Style','pushbutton','String','Quit', ...
                     'FontSize',15, 'Position', [197.5 230 150 40], ...
                     'Interruptible', 'off');
        quitBtn.Callback = @quitGame;
        
        wait = waitforbuttonpress;
        while wait ~= 0
            wait = waitforbuttonpress; 
        end
        
    end
    end
end
end

