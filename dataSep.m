function[output] = dataSep(data)

n = size(data,1);
n = data(n,4);

for i=1:n
    tempData = data(data(:,4)==i,:);
    dataArray{i,1}=tempData;
end

output=dataArray;

end