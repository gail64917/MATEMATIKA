function ReducedMatrix = Step1(Matrix, MAXIMIZE)
    if MAXIMIZE == 1
        column_max = max(Matrix);
        full_max = max(column_max);
        Matrix = full_max - Matrix;
        %print_Matrix(Matrix);
    end 
    String_Min = min(Matrix, [], 2);
    Matrix_New = Matrix - String_Min;
    %print_Matrix(Matrix_New);
    Column_Min = min(Matrix_New, [], 1);
    ReducedMatrix = Matrix_New - Column_Min;
    %print_Matrix(ReducedMatrix);
end