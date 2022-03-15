 function [yout]=sum_rela(c,l,N1)
        c=c.*c;
         N2=length(l)-2;
         a=zeros(N2,l(N2-1));
         
         for k=1:N2
             a(k,(1:l(1+k)))=c((sum(l(1:k))+1):sum(l(1:(k+1))));
         end
         N3=N1/2^(N2);
         N4=floor(l(2)/N3);
           b=zeros(N2,N4);
           
           for k=1:N2
               k1=log2(N3)+k-1;
               x=sumup(a(k,:),2^k1);
               b(k, 1:(ceil(l(k+1)/2^k1))-1) =x(1:(ceil(l(k+1)/2^k1))-1);
           end
           z=b;
           for s=1:N2;
           z(s,:)=b(N2+1-s,:);
           end
           y=z(:,1:(ceil(l(k+1)/2^k1)-1));
           yout=relative_energy(y);
          
             