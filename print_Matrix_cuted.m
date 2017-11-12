function print_Matrix_cuted(Matrix, deleted_columns, deleted_strings)
    n = size(Matrix, 1);
    indexer = 1;
    for i = 1:n
        for j = 1:n
            %if (deleted_strings(indexer) == i && deleted_columns(indexer) == j)
            if (is_having(i, j, deleted_columns, deleted_strings) == 1)
                fprintf(" %3d* ", Matrix(i, j));
                indexer = indexer + 1;
            else
                fprintf(" %3d ", Matrix(i, j));
            end
        end
        fprintf("\n");
    end
    fprintf("\n");
end

function have = is_having(i, j, deleted_columns, deleted_strings)
    if (find(deleted_columns == i) == find(deleted_strings == j))
        have = 1;
    else
        have = 0;
    end     
end