unit Array_Hex;
interface
type
    hexArray_Integer = array[0..1000] of integer;
    SORT_TYPE = (SMALL_TO_LARGE, LARGE_TO_SMALL);
    hexMerge = record
                main: array[0..25] of hexArray_Integer;
            end;
function array_min_int (arr: hexArray_Integer): integer;
function array_max_int (arr: hexArray_Integer): integer;
function array_sum_int (arr: hexArray_Integer): integer;
function array_sort_int (arr: hexArray_Integer; type_sort: SORT_TYPE): hexArray_Integer;
function array_remove_int (arr: hexArray_Integer; number: integer): hexArray_Integer;
function array_push_int (arr: hexArray_Integer; number: integer): hexArray_Integer;
function getLength_Array (arr: hexArray_Integer): integer;
function range_array_integer (Min: integer;Max:integer; byFar:integer): hexArray_Integer;
function replace_element_array_integer (arr: hexArray_Integer; ors: integer; repl: integer): hexArray_Integer;
implementation

    function array_min_int (arr: hexArray_Integer): integer;
    var
        i: integer;
        getLength: integer;
        min: integer;
    begin
        getLength := getLength_Array(arr);
    
        if getLength <= 0 then begin
            array_min_int := 0;
        end
        else begin
            min := arr[0];
            for i:=0 to getLength-1 do begin
                if arr[i] < min then begin
                    min := arr[i];
                end;
            end;
            array_min_int := min;
        end;
    end;

    function array_max_int (arr: hexArray_Integer): integer;
    var
        i, getLength, max: integer;
    begin
        getLength := getLength_Array(arr);
        if getLength <= 0 then begin
            array_max_int := 0;
        end
        else begin
            max := arr[0];
            for i:=0 to getLength-1 do begin
                if arr[i] > max then begin
                    max := arr[i];
                end;
            end;
            array_max_int := max;
        end;
    end;

    function array_sum_int (arr: hexArray_Integer): integer;
    var
        i, result, getLength: integer;
    begin
        getLength := getLength_Array(arr);
        if getLength <= 0 then begin
            array_sum_int := 0;
        end
        else begin
            result := 0;
            for i:=0 to getLength - 1 do begin
                result := result + arr[i];
            end;
            array_sum_int := result;
        end;
    end;

    function array_sort_int (arr: hexArray_Integer; type_sort: SORT_TYPE): hexArray_Integer;
    var
        i, realstt, trush: integer;
        newArr: hexArray_Integer;
    begin
        realstt := 0;
        if type_sort = LARGE_TO_SMALL then begin
            for i:=0 to getLength_Array(arr) do begin
                trush := array_max_int(arr);
                newArr[realstt] := trush;
                realstt := realstt + 1;
                arr := array_remove_int(arr, trush);
            end;
            array_sort_int := newArr;
        end
        else if type_sort = SMALL_TO_LARGE then begin
            for i:=0 to getLength_Array(arr) do begin
                trush := array_min_int(arr);
                newArr[realstt] := trush;
                realstt := realstt + 1;
                arr := array_remove_int(arr, trush);
            end;
            array_sort_int := newArr;
        end
        else begin
            array_sort_int := newArr;
        end;
        
    end;
    {
        push element
    }
    function array_push_int (arr: hexArray_Integer; number: integer): hexArray_Integer;
    var
        length: integer;
    begin
        length := getLength_Array(arr);
        if length <> 0 then begin
            arr[getLength_Array(arr)] := number;  
        end
        else begin
            arr[0] := number;
        end;
        array_push_int := arr;
    end;

    function array_remove_int (arr: hexArray_Integer; number: integer): hexArray_Integer;
    var
        newArr: hexArray_Integer;
        i, realstt: integer;
    begin
        for i:=0 to getLength_Array(arr) do begin
            if arr[i] <> number then begin
                newArr[realstt] := arr[i];
                realstt := realstt + 1;
            end;
        end;
        array_remove_int := newArr;
    end;

    function getLength_Array (arr: hexArray_Integer): integer;
    var
        result: integer;
        i: integer;
    begin
        result := 0;
        for i:=0 to length(arr) do begin
            if arr[i] = 0 then begin
                break;
            end
            else begin
                result := result + 1;
            end;
        end;
        getLength_Array := result;
    end;

    function range_array_integer (Min: integer;Max:integer; byFar:integer): hexArray_Integer;
    var
        rangeArr: hexArray_Integer;
        i, current:integer;
    begin
        current := -1;
        rangeArr := array_push_int(rangeArr, Min);
        for i:=Min to Max do begin
            current := current + 1;
            if (current = byFar) then begin
                rangeArr := array_push_int(rangeArr, i);
                current := 0;
            end;
        end;
        Range_Array_Integer := rangeArr;
    end;


    function replace_element_array_integer (arr: hexArray_Integer; ors: integer; repl: integer): hexArray_Integer;
    var
        returnArr: hexArray_Integer;
        i: integer;
    begin
        for i:=0 to getLength_Array(arr)-1 do begin
            if arr[i] = ors then begin
                arr[i] := repl;
            end;
        end;
        replace_element_array_integer := arr;
    end;
end.
