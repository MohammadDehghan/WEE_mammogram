 function y=relative_energy(DATA)
           [M,N]=size(DATA);
          y=zeros(M,N);
         
           relative=sum(DATA);
          for n=1:N
              for m=1:M
                  y(m,n)=DATA(m,n)/relative(n);
              end
          end
        
          
    