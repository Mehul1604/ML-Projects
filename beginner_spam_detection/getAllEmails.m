function [file_arr] = getAllEmails (folder1,folder2)
  
reg1 = [folder1,'/0*'];
reg2 = [folder2 , '/0*'];
file_arr = glob(reg1)(1:50);
file_arr = [file_arr ; glob(reg2)(1:50)];
for i = 1:length(file_arr)
  file_arr{i} = readFile(file_arr{i});
end


endfunction
