function [spam_file_arr] = getSpam (folder1)
  
reg1 = [folder1,'/0*'];
spam_file_arr = glob(reg1)(1:50);
for i = 1:length(spam_file_arr)
  spam_file_arr{i} = readFile(spam_file_arr{i});
end


endfunction
