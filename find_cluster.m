function clusters = find_cluster(coords)
    n = size(coords, 1);
    clusters = [];
    count = 0;
    combs = nchoosek(1:n, 3);
    tol = 1e-6; % tolerance value
    for i = 1:size(combs, 1)
        c1 = coords(combs(i, 1), :);
        c2 = coords(combs(i, 2), :);
        c3 = coords(combs(i, 3), :);
        d12 = sqrt((c1(1)-c2(1))^2 + (c1(2)-c2(2))^2);
        d13 = sqrt((c1(1)-c3(1))^2 + (c1(2)-c3(2))^2);
        d23 = sqrt((c2(1)-c3(1))^2 + (c2(2)-c3(2))^2);
        if abs(d12 - 18) < tol && abs(d13 - 9*sqrt(2)) < tol && abs(d23 - 9*sqrt(2)) < tol
            count = count + 1;
                if c3(2)-c2(2)>0&&c3(2)-c1(2)>0
                clusters(count, :) = [c1, c2, c3, 1]; % up
                elseif c3(2)-c2(2)<0&&c3(2)-c1(2)<0
                clusters(count, :) = [c1, c2, c3, 2]; % down
                elseif c3(1)-c2(1)>0&&c3(1)-c1(1)>0
                clusters(count, :) = [c1, c2, c3, 3]; % right
                elseif c3(1)-c2(1)<0&&c3(1)-c1(1)<0
                clusters(count, :) = [c1, c2, c3, 4]; % left
                end
        elseif abs(d13 - 18) < tol && abs(d12 - 9*sqrt(2)) < tol && abs(d23 - 9*sqrt(2)) < tol
            count = count + 1;
                if c2(2)-c1(2)>0&&c2(2)-c3(2)>0
                clusters(count, :) = [c1, c2, c3, 1]; % up
                elseif c2(2)-c1(2)<0&&c2(2)-c3(2)<0
                clusters(count, :) = [c1, c2, c3, 2]; % down
                elseif c2(1)-c1(1)>0&&c2(1)-c3(1)>0
                clusters(count, :) = [c1, c2, c3, 3]; % right
                elseif c2(1)-c1(1)<0&&c2(1)-c3(1)<0
                clusters(count, :) = [c1, c2, c3, 4]; % left
                end
        elseif abs(d23 - 18) < tol && abs(d12 - 9*sqrt(2)) < tol && abs(d13 - 9*sqrt(2)) < tol
            count = count + 1;
                if c1(2)-c2(2)>0&&c1(2)-c3(2)>0
                clusters(count, :) = [c1, c2, c3, 1]; % up
                elseif c1(2)-c2(2)<0&&c1(2)-c3(2)<0
                clusters(count, :) = [c1, c2, c3, 2]; % down
                elseif c1(1)-c2(1)>0&&c1(1)-c3(1)>0
                clusters(count, :) = [c1, c2, c3, 3]; % right
                elseif c1(1)-c2(1)<0&&c1(1)-c3(1)<0
                clusters(count, :) = [c1, c2, c3, 4]; % left
                end
            end
        end
end



