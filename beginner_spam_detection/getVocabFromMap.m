

function [vocList] = getVocabFromMap(map)
  
  fieldArr = fieldnames(map);
  valueArr = []
  for i = 1:numel(fieldArr)
    valueArr(i) = map.(fieldArr{i});
  end
  
  
  fullvocList = cell(numel(fieldArr) , 1);
  for i  = 1:numel(fieldArr)
    [ignore , max_ind] = max(valueArr);
    fullvocList{i} = fieldArr{max_ind};
    valueArr(max_ind) = -10;
  end
  
  vocList = fullvocList(1:3000);
      
      
      
    

endfunction
