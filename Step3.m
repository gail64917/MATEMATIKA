function NewMatrix = Step3(Matrix)
    n = size(Matrix, 1);
    Copy_Matrix = Matrix
    
    %пока количество нулей в матрице больше 0 - урезаем матрицу
    while(length(num2str(Copy_Matrix) == '0') > 0)  
        
        % оличество нулей в строках
        zeros_in_string = zeros(1,n);
        for i = 1:n
            zeros_in_string(i) = 0;
            for j = 1:n
                if (Matrix(i,j) == 0)
                   zeros_in_string(i) =  zeros_in_string + 1;
                end
            end
        end

        %количество нулей в столбцах
        zeros_in_columns = zeros(1,n);
        for i = 1:n
            zeros_in_columns(i) = 0;
            for j = 1:n
                if (Matrix(i,j) == 0)
                   zeros_in_columns(i) =  zeros_in_columns + 1;
                end
            end
        end
        
    end
end