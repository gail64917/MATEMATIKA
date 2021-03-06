function New_Matrix = Step3(Matrix)
	New_Matrix = Matrix;

	deleted_strings = zeros(1,10);
	deleted_columns = zeros(1,10);

	while(Count_matrix_zeros(New_Matrix,deleted_strings,deleted_columns) > 0)
		%�������� ������/������� � ���������� ���-��� �����
        [index_max_string, index_max_column] = find_max_count_zeros(New_Matrix, deleted_strings, deleted_columns);
        [deleted_columns,deleted_strings] = Delete_smth(index_max_string, index_max_column, deleted_columns,deleted_strings);
    end
    
    New_Matrix = change_matrix(New_Matrix, deleted_columns,deleted_strings);
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ������� ���-�� ����� �� ���� ������� 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function count_last_zeros = Count_matrix_zeros(Matrix,deleted_strings,deleted_columns)
    count_last_zeros = 0;
	for i = 1:size(Matrix,1)
		for j = 1:size(Matrix,2)
            if (Matrix(i,j)==0 && any(deleted_strings(:) == i) == 0 && any(deleted_columns(:) == j) == 0)
				count_last_zeros = count_last_zeros + 1;
			end
		end
	end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ������� �������/������ � ���������� ���-��� ���������� �������������� ����� 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [index_max_string, index_max_column] = find_max_count_zeros(Matrix, deleted_strings, deleted_columns)
    count_max_zeros_string = 0;
    count_max_zeros_column = 0;
    for i = 1:size(Matrix,1)
        count_this_string = 0;
        for j = 1:size(Matrix,2)
            if (Matrix(i,j)==0 && any(deleted_strings(:) == i) == 0 && any(deleted_columns(:) == j) == 0)
                count_this_string = count_this_string + 1;
            end
        end
        if (count_this_string > count_max_zeros_string) 
            index_max_string = i;
            count_max_zeros_string = count_this_string;
        end
    end
    
    for j = 1:size(Matrix,2)
        count_this_column = 0;
        for i = 1:size(Matrix,1)
            if (Matrix(i,j)==0 && any(deleted_strings(:) == i) == 0 && any(deleted_columns(:) == j) == 0)
                count_this_column = count_this_column + 1;
            end
        end
        if (count_this_column > count_max_zeros_column) 
            index_max_column = j;
            count_max_zeros_column = count_this_column;
        end
    end
    
    if (count_max_zeros_string > count_max_zeros_column)
        index_max_column = 0;
    else
        index_max_string = 0;
    end
end


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% �������� �������/������ � ���������� ���-��� �����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [deleted_columns,deleted_strings] = Delete_smth(index_max_string, index_max_column, deleted_columns, deleted_strings)
   if (index_max_string == 0)
       deleted_columns(nnz(deleted_columns)+1) = index_max_column;
   else 
       deleted_strings(nnz(deleted_strings)+1) = index_max_string;
   end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% ������� ����������� ������� � ����������� ��� � ������������� �������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function New_Matrix = change_matrix(New_Matrix, deleted_columns,deleted_strings)
     minimum = 99999;
     for i = 1:size(New_Matrix,1)
        for j = 1:size(New_Matrix,2)
            if (New_Matrix(i,j) < minimum && any(deleted_strings(:) == i) == 0 && any(deleted_columns(:) == j) == 0)
                minimum = New_Matrix(i,j);
            end
        end
     end
     for i = 1:size(New_Matrix,1)
        for j = 1:size(New_Matrix,2)
            if (any(deleted_strings(:) == i) == 0 && any(deleted_columns(:) == j) == 0)
                New_Matrix(i,j) = New_Matrix(i,j) - minimum;
            end
            if (any(deleted_strings(:) == i) == 1 && any(deleted_columns(:) == j) == 1)
                New_Matrix(i,j) = New_Matrix(i,j) + minimum;
            end
        end
     end
end