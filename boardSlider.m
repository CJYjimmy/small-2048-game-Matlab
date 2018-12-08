%
% [updatedArr, updatedScore] = boardSlider(arr,direction, score)
% ** the function move the values in the array in the specified direction,
% merging like tiles in the same fashion as the original game, 2048 **
%
% arr = an array containing  values of tiles and blanks, where
% a blank space is represented by a 0 and a tile is represented by an
% exponential of 2. 
% direction = string representation of user input from arrow keys - 'left',
% 'right', 'up', or 'down'
% score = the current score of the game
%
% updatedArr = the arr after transition
% updatedScore = the new calculated score, calculated based on the number
% of tiles created
function [updatedArr, updatedScore] = boardSlider(arr,direction, score)
switch direction
    case 'up'
        for k = 1:4
            vec = arr(:,k);
            index = find(vec);
            arr(:,k) = 0;
            for i = 1:length(index)
                arr(i,k) = vec(index(i));
            end
            for i = 1:3
                if arr(i,k) == arr(i+1,k)
                    arr(i,k) = 2 * arr(i,k);
                    arr(i+1,k) = 0;
                    score = score + arr(i,k);
                end
            end
            vec = arr(:,k);
            index = find(vec);
            arr(:,k) = 0;
            for i = 1:length(index)
                arr(i,k) = vec(index(i));
            end
        end
    case 'down'
        for k = 1:4
            vec = arr(end:-1:1,k);
            index = find(vec);
            arr(:,k) = 0;
            for i = 1:length(index)
                arr(5-i,k) = vec(index(i));
            end
            for i = 4:-1:2
                if arr(i,k) == arr(i-1,k)
                    arr(i,k) = 2 * arr(i,k);
                    arr(i-1,k) = 0;
                    score = score + arr(i,k);
                end
            end
            vec = arr(end:-1:1,k);
            index = find(vec);
            arr(:,k) = 0;
            for i = 1:length(index)
                arr(5-i,k) = vec(index(i));
            end
        end
    case 'right'
        for k = 1:4
            vec = arr(k,end:-1:1);
            index = find(vec);
            arr(k,:) = 0;
            for i = 1:length(index)
                arr(k,5-i) = vec(index(i));
            end
            for i = 4:-1:2
                if arr(k,i) == arr(k,i-1)
                    arr(k,i) = 2 * arr(k,i);
                    arr(k,i-1) = 0;
                    score = score + arr(k,i);
                end
            end
            vec = arr(k,end:-1:1);
            index = find(vec);
            arr(k,:) = 0;
            for i = 1:length(index)
                arr(k,5-i) = vec(index(i));
            end
        end
    case 'left'
        for k = 1:4
            vec = arr(k,:);
            index = find(vec);
            arr(k,:) = 0;
            for i = 1:length(index)
                arr(k,i) = vec(index(i));
            end
            for i = 1:3
                if arr(k,i) == arr(k,i+1)
                    arr(k,i) = 2 * arr(k,i);
                    arr(k,i+1) = 0;
                    score = score + arr(k,i);
                end
            end
            vec = arr(k,:);
            index = find(vec);
            arr(k,:) = 0;
            for i = 1:length(index)
                arr(k,i) = vec(index(i));
            end
        end
end
updatedArr = arr;
updatedScore = score;
end