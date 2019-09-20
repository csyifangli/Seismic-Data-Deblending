data=load('model1_150_by_150_shot_106_255.mat');
cmpgth=cell(1,299);
for n=2:300
    for i=1:150
        for j=1:150
            if (i+j)==n
                
                cmpgth{1,n-1}=[cmpgth{1,n-1},data.data(:,i,j)];
            end
            
        end
    end
end
        