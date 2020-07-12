function [gdop_t,pdop_t,hdop_t,vdop_t] = calculo_dop(G)
    %% Matriz inversa de covarianza
    T=G'*G;
    D=pinv(T);
    Tr=(trace(D));
    %% Calculo de DOP
    gdop_t=sqrt(Tr);
    pdop_t=sqrt(D(1,1)+D(2,2)+D(3,3));
    hdop_t=sqrt(D(1,1)+D(2,2));
    vdop_t=sqrt(D(3,3));
end

