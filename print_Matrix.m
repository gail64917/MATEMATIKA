function print_Matrix(Cm)
    n = size(Cm, 1);
    for i = 1:n
        for j = 1:n
                fprintf(" %3d ", Cm(i, j));
        end
        fprintf("\n");
    end
    fprintf("\n");
    fprintf("\n");
end