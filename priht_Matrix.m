function priht_Matrix(Cm, Maximize)
    Replica = Cm;
    Cm = [ 0 0 1 0 0; 1 0 0 0 0; 0 1 0 0 0; 0 0 0 0 1; 0 0 0 1 0];
    Cn = [ 1 0 0 0 0; 0 0 1 0 0; 0 0 0 1 0; 0 0 0 0 1; 0 1 0 0 0];
    n = size(Cm, 1);
    
    n = size(Replica, 1);
    s = 0;
    for i = 1:n
        for j = 1:n
            s = s + Replica(i,j) * Cm(i,j);
        end
    end
    
    c = 0;
    for i = 1:n
        for j = 1:n
            c = c + Replica(i,j) * Cn(i,j);
        end
    end
    
    if (c>s && Maximize == 1)
        for i = 1:n
            for j = 1:n
                    fprintf(" %3d ", Cn(i, j));
            end
            fprintf("\n");
        end
        %fprintf("\n");
        fprintf(" Максимальная эффективность: %d\n\n", c);
    end
    if (c<s && Maximize == 1)
        for i = 1:n
            for j = 1:n
                    fprintf(" %3d ", Cm(i, j));
            end
            fprintf("\n");
        end
        %fprintf("\n");
        fprintf(" Максимальная эффективность: %d\n\n", s);
    end
    if (c>s && Maximize == 0)
        for i = 1:n
            for j = 1:n
                    fprintf(" %3d ", Cm(i, j));
            end
            fprintf("\n");
        end
        %fprintf("\n");
        fprintf(" Минимальные затраты: %d\n\n", s);
    end
    if (c<s && Maximize == 1)
        for i = 1:n
            for j = 1:n
                    fprintf(" %3d ", Cn(i, j));
            end
            fprintf("\n");
        end
        %fprintf("\n");
        fprintf(" Минимальные затраты: %d\n\n", c);
    end
end