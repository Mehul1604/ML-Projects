function [non_spam_file_arr] = getNonSpam (folder1)
  
reg1 = [folder1,'/0*'];
non_spam_file_arr = glob(reg1)(1:50);
for i = 1:length(non_spam_file_arr)
  non_spam_file_arr{i} = readFile(non_spam_file_arr{i});
end


endfunction
