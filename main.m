function main(FULL_MATRIX, Maximize, Debug)
    fprintf(" �������� ������� ����������: \n");
    print_Matrix(FULL_MATRIX);
    if Maximize ~= 0
        fprintf("������������ �����������\n\n�������:\n");
    else
        fprintf("����������� �����������\n\n�������:\n");
    end

    Reduced_Matrix = Step1(FULL_MATRIX, Maximize);
    [result, choosen] = Step2(Reduced_Matrix, Debug);
    while (result == 0)
        Reduced_Matrix = Step3(Reduced_Matrix);
        [result, choosen] = Step2(Reduced_Matrix, 1);
    end
    
    n = size(FULL_MATRIX, 1);
    s = 0;
    for i = 1:n
        for j = 1:n
            s = s + FULL_MATRIX(i,j) * choosen(i,j);
        end
    end
    
    if Maximize ~= 0
        fprintf(" ������������ �������������: %d\n\n", s);
    else
        fprintf(" ����������� �������: %d\n\n", s);
    end
end