function lines = find_lines(coords)
    n = size(coords, 1);
    num_lines = nchoosek(n, 3);
    lines = zeros(num_lines,7);
    count = 0;
    combs = nchoosek(1:n, 3);
    for i = 1:size(combs, 1)
        c1 = coords(combs(i, 1), :);
        c2 = coords(combs(i, 2), :);
        c3 = coords(combs(i, 3), :);
        %if vertical
        if c1(1) == c2(1) && c2(1) == c3(1)
            if abs(c1(2)-c2(2)) == 18 && abs(c2(2)-c3(2)) == 18
                count = count + 1;
                lines(count, :) = [c1, c2, c3,1];
            end
        %if horizontal
        elseif c1(2) == c2(2) && c2(2) == c3(2)
            if abs(c1(1)-c2(1)) == 18 && abs(c2(1)-c3(1)) == 18
                count = count + 1;
                lines(count, :) = [c1, c2, c3,2];
            end
        end
    end
    lines = lines(1:count, :);
end

