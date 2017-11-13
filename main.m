function main(FULL_MATRIX, Maximize, Debug)
    fprintf(" Исходная матрица стоимостей: \n");
    print_Matrix(FULL_MATRIX);
    if Maximize ~= 0
        fprintf("Максимизация функционала\n\nРешение:\n");
    else
        fprintf("Минимизация функционала\n\nРешение:\n");
    end
    
    indexer = 0;

    Reduced_Matrix = Step1(FULL_MATRIX, Maximize);
    [result, choosen] = Step2(Reduced_Matrix, Debug);
    while (result == 0)
        Reduced_Matrix = Step3(Reduced_Matrix);
        [result, choosen] = Step2(Reduced_Matrix, 1);
        indexer = indexer + 1;
        if (indexer == 15)
           priht_Matrix(FULL_MATRIX, Maximize); 
           break
        end
    end
    
    if (indexer ~= 15)
        n = size(FULL_MATRIX, 1);
        s = 0;
        for i = 1:n
            for j = 1:n
                s = s + FULL_MATRIX(i,j) * choosen(i,j);
            end
        end

        if Maximize ~= 0
            fprintf(" Максимальная эффективность: %d\n\n", s);
        else
            fprintf(" Минимальные затраты: %d\n\n", s);
        end
    end
end