function NewMatrix = Step3(Matrix)
    n = size(Matrix, 1);
    
    %���������� ����� � �������
    zeros_in_string = zeros(1,n);
    for i = 1:n
        zeros_in_string(i) = 0;
        for j = 1:n
            if (Matrix(i,j) == 0)
               zeros_in_string(i) =  zeros_in_string + 1;
            end
        end
    end
    
    %���������� ����� � ��������
    zeros_in_string = zeros(1,n);
    for i = 1:n
        zeros_in_string(i) = 0;
        for j = 1:n
            if (Matrix(i,j) == 0)
               zeros_in_string(i) =  zeros_in_string + 1;
            end
        end
    end
end