
function [locations] = findNeighbors(a,b, input)


[rows, cols] = size(input);
locations = [];

if(isInBounds(a+1, b, rows, cols)==1 && input(a+1, b) > 0)  
    locations = [locations; [a+1, b]];
end

if(isInBounds(a, b+1, rows, cols)==1 && input(a, b+1) > 0)  
    locations = [locations; [a, b+1]];
end

if(isInBounds(a-1, b, rows, cols)==1 && input(a-1, b) >0)  
    locations = [locations; [a-1, b]];
end

if(isInBounds(a, b-1, rows, cols)==1 && input(a, b-1) >0)  
    locations = [locations; [a, b-1]];
end

end