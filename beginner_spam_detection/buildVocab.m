
function [vocList , freqMap] = buildVocab (fileArr)

freqMap = struct();

for i = 1:length(fileArr)
  cur_content = fileArr{i};
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
    end
    
    if(isfield(freqMap , str))
      freqMap.(str) = freqMap.(str) + 1;
    else
      freqMap.(str) = 1;
    endif
    
  
  end

  
end





vocList = 1;

endfunction
