
function [X] = buildX (dataSet , vocabList)
  
  
  m = numel(dataSet);
  X = zeros(m , numel(vocabList));
  for i = 1:m
    
    word_indices = [];
    cur_content = dataSet{i};
    cur_content = lower(cur_content);

  % Strip all HTML
  % Looks for any expression that starts with < and ends with > and replace
  % and does not have any < or > in the tag it with a space
   cur_content = regexprep(cur_content, '<[^<>]+>', ' ');

  % Handle Numbers
  % Look for one or more characters between 0-9
   cur_content = regexprep(cur_content, '[0-9]+', 'number');

  % Handle URLS
  % Look for strings starting with http:// or https://
   cur_content = regexprep(cur_content, ...
                             '(http|https)://[^\s]*', 'httpaddr');

  % Handle Email Addresses
  % Look for strings with @ in the middle
   cur_content = regexprep(cur_content, '[^\s]+@[^\s]+', 'emailaddr');

  % Handle $ sign
   cur_content = regexprep(cur_content, '[$]+', 'dollar');
   l = 0;
   
     while ~isempty(cur_content)
      [str , cur_content] = strtok(cur_content , [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
      str = regexprep(str, '[^a-zA-Z0-9]', '');
      
      try str = porterStemmer(strtrim(str)); 
      catch str = ''; continue;
      end;
    
      if length(str) < 1
         continue;
      endif
      
      cmp_arr = strcmp(vocabList , str);
      if(sum(cmp_arr) == 1)
        [w,iw] = max(cmp_arr);
        word_indices = [word_indices ; iw];
      endif
      
      
     end
     
     
     
     x = zeros(numel(vocabList) , 1);
     for j = 1:numel(vocabList)
       x(j) = any(word_indices == j);
     end
     
     X(i,:) = x';
    
    
   
  end
  
  
    
endfunction
