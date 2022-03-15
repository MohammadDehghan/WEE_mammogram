function y=sumup(DATA,interval)
    [M,N]=size(DATA);
   N1=floor(N/interval);
     y=zeros(M,N1);
  
  for k=1:M
        for l=1:N1
            m=0;
            for n=1:interval
                m=DATA(k,(l-1)*interval+n)+m;
            end
           y(k,l)=m ;
        end
  end     