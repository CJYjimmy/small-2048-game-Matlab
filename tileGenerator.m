%
%updatedArr = tileGenerator(arr)
%takes in a 4x4 array of doubles
%randomly generate a 2 or 4 on the board in place of a 0
%returns the input if the input array is not a 4X4 array of doubles
function updatedArr = tileGenerator(arr)
[rows cols] = size(arr);
if isnumeric(arr) & rows == 4 & cols == 4
    mask = arr == 0;
    [row col] = find(mask);
    len = length(row);
    randomE = randperm(len,1);
    r = row(randomE);
    c = col(randomE);
    tile = randperm(2,1) .* 2;
    arr(r,c) = tile;
end
updatedArr = arr;
end