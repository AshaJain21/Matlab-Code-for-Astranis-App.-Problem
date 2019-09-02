function [result] = isInBounds(a,b,rows, cols)

%If the indices are not witin the bounds of the matrix, result equals 0. 
if(a<=0 || a>rows || b<=0 || b>cols)
    result = 0;
else
    result = 1;
end

end
