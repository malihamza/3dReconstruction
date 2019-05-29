function I2=f_warp(I1,H)
    r=size(I1,1);
    c=size(I1,2);
    I1=rgb2gray(I1);
    %I2=rgb2gray(I2)
    P=H*[1 1 r r;1 c 1 c;1 1 1 1];
    P=P./P(3,:);
    P(3,:)=[];
 
    mins=min(P,[],2);
    minR=floor(mins(1));
    minC=floor(mins(2));
    maxs=max(P,[],2);
    maxR=ceil(maxs(1));  
    maxC=ceil(maxs(2));
    r2=ceil(maxR-minR+1)
    c2=ceil(maxC-minC+1)
    I2=zeros(r2,c2);
    %I2(end:r2,end:c2,3)=0;
    invH=inv(H);
    for i=minR : maxR
        for j=minC : maxC
            P=invH*[i;j;1];
            P=P./P(3,1);
            P(3)=[];
            %disp(P(1)+"dfs"+P(2));
            if(P(1)>=1&&P(2)>=1&&P(1)<=r&&P(2)<=c)
                prevR=floor(P(1));
                prevC=floor(P(2));
                nextR=ceil(P(1));
                nextC=ceil(P(2));
                d = [sqrt((prevR-P(1)).^2+(prevC-P(2)).^2) sqrt((prevR-P(1)).^2+(nextC-P(2)).^2) ...
                    sqrt((nextR-P(1)).^2+(prevC-P(2)).^2) sqrt((nextR-P(1)).^2+(nextC-P(2)).^2)];
%                 d1=sqrt((prevR-P(1)).^2+(prevC-P(2)).^2);
%                 d2=sqrt((prevR-P(1)).^2+(nextC-P(2)).^2);
%                 d3=sqrt((nextR-P(1)).^2+(prevC-P(2)).^2);
%                 d4=sqrt((nextR-P(1)).^2+(nextC-P(2)).^2);
                %disp(prevR+"p"+prevC+"p"+nextR+"x"+nextC+"dd"+r+"dd"+c);
                
                %sum=d1+d2+d3+d4;
                dSum = sum(d);
%                 d1 = d1/sum1;
%                 
%                 d2 = d2/sum1;
%                 
%                 d3 = d3/sum1;
%                 
%                 d4 = d4/sum1;
%                 
    % above part was missing but now I am going to wite that with short
    % code

               d = d./dSum;

                I=[I1(prevR,prevC)*d(1) I1(prevR,nextC)*d(2) I1(nextR,prevC)*d(3) I1(nextR,nextC)*d(4)];
                
                
                I2(ceil(i-minR+1),ceil(j-minC+1))=sum(I);
                
            end
        end
    end
end