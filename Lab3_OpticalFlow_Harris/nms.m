function [H] = nms(H, w_size, top_N)
% Non maximal suppresion of the ( at most top_N ) values

sorted_uniq_values = unique(H(:));
hist = histc(H(:), sorted_uniq_values);


idx = length(hist);
sum = 0;
while sum < top_N
    sum = sum + hist(idx);
    idx = idx - 1;
end

threshold = sorted_uniq_values(idx+2);

H(H<threshold) = 0;

maxs = ordfilt2(H, w_size*w_size, true(w_size));

H(H~=maxs) = 0;

end

