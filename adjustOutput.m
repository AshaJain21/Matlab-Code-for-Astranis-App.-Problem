function [output] = adjustOutput(locations, rows, cols)

output = false(rows, cols);
for index= 1:size(locations)
    output(locations(index, 1), locations(index,2)) = true;

end

end