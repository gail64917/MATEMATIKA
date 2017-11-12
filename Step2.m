function [result, choosen] = Step2(Matrix, Debug)
    result = 1;
    n = size(Matrix, 1);
    
    choosen_strings = zeros(1,n);
    indexer_choosen_strings = 1;
    
    choosen_columns = zeros(1,n);
    indexer_choosen_columns = 1;
    
    choosen_zeros = 0;
    while (choosen_zeros < n)
        not_found = 1;
        
        secret_i = 0;
        secret_j = 0;
        
        %Пробегаемся по каждой строке, если в некоторой строке находим 1
        %НОЛЬ, из неотмеченного столбца и строки,  то выходим из цикла и 
        %помечаем этот НОЛЬ
        for i = 1:n
            temp_j = 0;
            zeros_in_string = 0;
            for j = 1:n
                if (Matrix(i,j) == 0 && ~ismember(i,choosen_strings) && ~ismember(j,choosen_columns))
                   zeros_in_string =  zeros_in_string + 1;
                   temp_j = j;
                end
            end
            if (zeros_in_string == 1)
                   choosen_strings(indexer_choosen_strings) = i;
                   indexer_choosen_strings = indexer_choosen_strings + 1;
                   
                   choosen_columns(indexer_choosen_columns) = temp_j;
                   indexer_choosen_columns = indexer_choosen_columns + 1;   
                   
                   choosen_zeros = choosen_zeros + 1;
                   not_found = 0;
                   break
            end
        end
        
        %Пробегаемся по каждому столбцу, если в некотором столбце находим 1
        %НОЛЬ, из неотмеченного столбца и строки,  то выходим из цикла и 
        %помечаем этот НОЛЬ
        for j = 1:n
            temp_i = 0;
            zeros_in_column = 0;
            for i = 1:n
                if (Matrix(i,j) == 0 && ~ismember(i,choosen_strings) && ~ismember(j,choosen_columns))
                   zeros_in_column =  zeros_in_column + 1;
                   temp_i = i;
                end
            end
            if (zeros_in_column == 1)
                   choosen_strings(indexer_choosen_strings) = temp_i;
                   indexer_choosen_strings = indexer_choosen_strings + 1;                           
                   
                   choosen_columns(indexer_choosen_columns) = j;
                   indexer_choosen_columns = indexer_choosen_columns + 1;
                   
                   choosen_zeros = choosen_zeros + 1;
                   not_found = 0;
                   
                   break
            end
        end
        
        if (not_found == 1)
            Remainder_Matrix = zeros(n-choosen_zeros, n-choosen_zeros);
            remainder_matrix_i = 1;
            remainder_matrix_j = 1;
            for i = 1:n
                for j = 1:n
                    if (~ismember(j,choosen_columns) && ~ismember(i,choosen_strings))
                        Remainder_Matrix(remainder_matrix_i, remainder_matrix_j) = Matrix(i,j);
                        remainder_matrix_j = remainder_matrix_j+1;
                        secret_i = i;
                        secret_j = j;
                    end
                end
                if (remainder_matrix_j>n-choosen_zeros)
                    remainder_matrix_i = remainder_matrix_i+1;
                end
            end
            if (sum(sum(Remainder_Matrix)) == 0)
                   choosen_strings(indexer_choosen_strings) = secret_i;
                   indexer_choosen_strings = indexer_choosen_strings + 1;
                                            
                   choosen_columns(indexer_choosen_columns) = secret_j;
                   indexer_choosen_columns = indexer_choosen_columns + 1;
                   
                   choosen_zeros = choosen_zeros + 1;
            end
            if (sum(sum(Remainder_Matrix)) ~= 0)
                result = 0;
                break
            end
        end
    end
    
    if (Debug == 1)
        print_Matrix_cuted(Matrix, choosen_columns, choosen_strings);
    end
    
    choosen = zeros(n,n);
    
    if (result ~= 0)
        for i = 1:n
           choosen(choosen_strings(i), choosen_columns(i)) = 1;
        end
        
        fprintf(" Матрица выборов: \n" );
        print_Matrix(choosen);
    end 
end